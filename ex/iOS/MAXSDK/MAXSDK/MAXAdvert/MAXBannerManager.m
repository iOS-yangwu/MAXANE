//
//  MAXBannerManager.m
//  MAXSDK
//
//  Created by 洋吴 on 2020/9/28.
//  Copyright © 2020 洋吴. All rights reserved.
//

#import "MAXBannerManager.h"
#import <AppLovinSDK/AppLovinSDK.h>
#import "MAXAdvertANEUtils.h"

@interface MAXBannerManager ()<MAAdViewAdDelegate>

@property (nonatomic, strong) MAAdView *adView;

@end

@implementation MAXBannerManager

+ (MAXBannerManager *)shareManager{
    
    static MAXBannerManager *shareManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareManager = [[MAXBannerManager alloc]init];
    });
    return shareManager;
}

- (void) loadAdWithUnitId:(NSString *)unitId align:(int)align{
    
    if (self.adView) {
        [self.adView loadAd];
    }else{
        
        self.adView = [[MAAdView alloc] initWithAdUnitIdentifier: unitId];
        self.adView.delegate = self;
        CGFloat height = (UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad) ? 90 : 50;
        CGFloat width = (UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad)?728:320;
        self.adView.frame = CGRectMake(0, 0, width, height);
        self.adView.backgroundColor = [UIColor whiteColor];
        
        
        CGFloat beforeX = self.adView.frame.origin.x;
        CGFloat beforeY = self.adView.frame.origin.y;
        //10 34
        CGPoint point = [self BannerAdjust:align bgView:[UIApplication sharedApplication].keyWindow.rootViewController.view bannerView:self.adView];
        CGRect rect = self.adView.frame;
        
        if (point.x < 0) {
            point.x = beforeX;
        }
        if (point.y < 0) {
            point.y = beforeY;
        }
       
        rect.origin.x = point.x;
        rect.origin.y = point.y;
        self.adView.frame = rect;
        [[UIApplication sharedApplication].keyWindow.rootViewController.view addSubview: self.adView];
        [self.adView loadAd];
    }
}

- (void) setExtraParameterForKey:(NSString *)key value:(nullable NSString *)value{
    
    if (self.adView) {
        [self.adView setExtraParameterForKey:key value:value];
    }
}

- (void) hideBanner{
    
    if (self.adView) {
        self.adView.hidden = YES;
        [self.adView stopAutoRefresh];
    }
}

- (void) showBanner{
    
    if (self.adView) {
        self.adView.hidden = NO;
        [self.adView startAutoRefresh];
    }
}

- (void)didClickAd:(nonnull MAAd *)ad {
    
    if (ad.format == MAAdFormat.banner) {
        
        MAXAdvertSendANEMessage(BannerClick,BannerClickCode,@"",@"");
    }
}

- (void)didDisplayAd:(nonnull MAAd *)ad {
    
    if (ad.format == MAAdFormat.banner) {
        
        MAXAdvertSendANEMessage(BannerDisplay,BannerDisplayCode,@"",@"");
    }
}

- (void)didFailToDisplayAd:(nonnull MAAd *)ad withErrorCode:(NSInteger)errorCode {
    
    if (ad.format == MAAdFormat.banner) {
        
        MAXAdvertSendANEMessage(BannerFailToDisplay,BannerFailToDisplayCode,@"",@"");
    }
}

- (void)didFailToLoadAdForAdUnitIdentifier:(nonnull NSString *)adUnitIdentifier withErrorCode:(NSInteger)errorCode {
    
    MAXAdvertSendANEMessage(BannerFailToLoad,BannerFailToLoadCode,@"",@"");

}

- (void)didHideAd:(nonnull MAAd *)ad {
    
    if (ad.format == MAAdFormat.banner) {
        
        MAXAdvertSendANEMessage(BannerHide,BannerHideCode,@"",@"");
    }
}

- (void)didLoadAd:(nonnull MAAd *)ad {
    
    if (ad.format == MAAdFormat.banner) {
        
        MAXAdvertSendANEMessage(BannerDidLoad,BannerDidLoadCode,@"",@"");
    }
}

- (void)didCollapseAd:(nonnull MAAd *)ad {
    
    if (ad.format == MAAdFormat.banner) {
        
        MAXAdvertSendANEMessage(BannerDidCollapse,BannerDidCollapseCode,@"",@"");
    }
}

- (void)didExpandAd:(nonnull MAAd *)ad {
    
    if (ad.format == MAAdFormat.banner) {
        
        MAXAdvertSendANEMessage(BannerDidExpandAd,BannerDidExpandAdCode,@"",@"");
    }
}

- (CGPoint)BannerAdjust:(int)align bgView:(UIView *)bgView bannerView:(UIView *)bannerView{
    
    UIView * parentView = bgView?bgView:[UIApplication sharedApplication].keyWindow.rootViewController.view;
    CGSize adSize = bannerView.frame.size;
    CGSize viewSize = parentView.bounds.size;
    CGPoint point;
    CGFloat x = 0;
    CGFloat y = 0;

    if ((align & BannerAlignLeft) == BannerAlignLeft){
        x = x ;
    } else if((align & BannerAlignRight) == BannerAlignRight){
        x = viewSize.width - adSize.width;
    } else if((align & BannerAlignHorizontalCenter) == BannerAlignHorizontalCenter){
        x = (viewSize.width - adSize.width) / 2;
        
        if (x == 0 || x < 0) {
            x = bannerView.bounds.origin.x;
        }
    }
    
    if ((align & BannerAlignTop) == BannerAlignTop) {
        y = y  + [[UIApplication sharedApplication] statusBarFrame].size.height;
        if ([MAXBannerManager biPhoneX] && ![MAXBannerManager isOrientationLandscape] && [UIApplication sharedApplication].statusBarHidden) {
            y = y + 44;
        }
    } else if((align & BannerAlignBottom) == BannerAlignBottom){
        y = viewSize.height - adSize.height ;
        if ([MAXBannerManager biPhoneX] && ![MAXBannerManager isOrientationLandscape]) {
            y = y - 34;
        }
    } else if((align & BannerAlignVerticalCenter) == BannerAlignVerticalCenter){
        y = (viewSize.height - adSize.height) / 2 ;
    }
    
    point.x = x;
    point.y = y;
    return point;
}

typedef enum {
    BannerAlignLeft               = 1 << 0,
    BannerAlignHorizontalCenter   = 1 << 1,
    BannerAlignRight              = 1 << 2,
    BannerAlignTop                = 1 << 3,
    BannerAlignVerticalCenter     = 1 << 4,
    BannerAlignBottom             = 1 << 5,
}BannerAlign;

+ (BOOL)isOrientationLandscape {
    UIDeviceOrientation screenOrientation = (UIDeviceOrientation)[[UIApplication sharedApplication] statusBarOrientation];
    return screenOrientation == UIDeviceOrientationLandscapeLeft || screenOrientation == UIDeviceOrientationLandscapeRight;
}

+ (BOOL)biPhoneX {
    if ([UIScreen instancesRespondToSelector:@selector(currentMode)]) {
        if (CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size)) {
            return YES;
        }
    }
    return NO;
}
@end
