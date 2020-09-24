//
//  MAXManager.m
//  MAXSDK
//
//  Created by 洋吴 on 2020/9/22.
//  Copyright © 2020 洋吴. All rights reserved.
//

#import "MAXInterstitialManager.h"
#import <AppLovinSDK/AppLovinSDK.h>
#import "MAXAdvertANEUtils.h"

@interface MAXInterstitialManager ()<MAAdDelegate>

@property (nonatomic, strong) MAInterstitialAd *interstitialAd;

@end


@implementation MAXInterstitialManager

+ (MAXInterstitialManager *)shareManager{
    
    static MAXInterstitialManager *shareManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareManager = [[MAXInterstitialManager alloc]init];
    });
    return shareManager;
}

- (void) loadAdWithUnitId:(NSString *)unitId{
    
    if (self.interstitialAd) {
        [self.interstitialAd loadAd];
    }else{
        
        self.interstitialAd = [[MAInterstitialAd alloc] initWithAdUnitIdentifier:unitId];
        self.interstitialAd.delegate = self;
        [self.interstitialAd loadAd];
        [self.interstitialAd setExtraParameterForKey:@"" value:@""];
    }
}

- (void)setExtraParameterForKey:(NSString *)key value:(nullable NSString *)value{
    
    if (self.interstitialAd) {
        [self.interstitialAd setExtraParameterForKey:key value:value];
    }
}

- (BOOL) isReady{
    
    return [self.interstitialAd isReady];
}

- (void) showAd{
    
    [self.interstitialAd showAd];
}

- (void) showAdForPlacement:(NSString *)placement{
    
    [self.interstitialAd showAdForPlacement:placement];
}

- (void)didLoadAd:(MAAd *)ad{
    
    if (ad.format == MAAdFormat.interstitial) {
        
        MAXAdvertSendANEMessage(InterstitialDidLoad, InterstitialDidLoadCode, @"", @"");
    }
}

- (void)didFailToLoadAdForAdUnitIdentifier:(NSString *)adUnitIdentifier withErrorCode:(NSInteger)errorCode{
    
    MAXAdvertSendANEMessage(InterstitialFailToLoad, InterstitialFailToLoadCode, @"errorCode", [NSString stringWithFormat:@"%ld",(long)errorCode]);
    
}

- (void)didDisplayAd:(MAAd *)ad{
    
    if (ad.format == MAAdFormat.interstitial) {
        
        MAXAdvertSendANEMessage(InterstitialDisplay, InterstitialDisplayCode, @"", @"");
    }
}

- (void)didHideAd:(MAAd *)ad{
    
    if (ad.format == MAAdFormat.interstitial) {
        
        MAXAdvertSendANEMessage(InterstitialHide, InterstitialHideCode, @"", @"");
    }
}

- (void)didClickAd:(MAAd *)ad{
    
    if (ad.format == MAAdFormat.interstitial) {
        
        MAXAdvertSendANEMessage(InterstitialClick, InterstitialClickCode, @"", @"");
    }
}

- (void)didFailToDisplayAd:(MAAd *)ad withErrorCode:(NSInteger)errorCode{
    
    if (ad.format == MAAdFormat.interstitial) {
        
        MAXAdvertSendANEMessage(InterstitialFailToDisplay, InterstitialFailToDisplayCode, @"errorCode", [NSString stringWithFormat:@"%ld",(long)errorCode]);
    }
    

}
@end
