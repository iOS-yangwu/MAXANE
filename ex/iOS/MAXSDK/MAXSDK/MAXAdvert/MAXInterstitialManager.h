//
//  MAXManager.h
//  MAXSDK
//
//  Created by 洋吴 on 2020/9/22.
//  Copyright © 2020 洋吴. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MAXInterstitialManager : NSObject

+ (MAXInterstitialManager *)shareManager;

- (void) loadAdWithUnitId:(NSString *)unitId;

- (void) setExtraParameterForKey:(NSString *)key value:(nullable NSString *)value;

- (BOOL) isReady;

- (void) showAd;

- (void) showAdForPlacement:(NSString *)placement;

@end

NS_ASSUME_NONNULL_END
