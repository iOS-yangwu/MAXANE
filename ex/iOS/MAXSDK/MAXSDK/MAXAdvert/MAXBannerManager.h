//
//  MAXBannerManager.h
//  MAXSDK
//
//  Created by 洋吴 on 2020/9/28.
//  Copyright © 2020 洋吴. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MAXBannerManager : NSObject

+ (MAXBannerManager *)shareManager;


- (void) loadAdWithUnitId:(NSString *)unitId align:(int)align;

- (void) setExtraParameterForKey:(NSString *)key value:(nullable NSString *)value;

- (void) hideBanner;

- (void) showBanner;

@end

NS_ASSUME_NONNULL_END
