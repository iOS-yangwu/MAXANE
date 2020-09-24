//
//  MAXSdkManager.h
//  MAXSDK
//
//  Created by 洋吴 on 2020/9/23.
//  Copyright © 2020 洋吴. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MAXSdkManager : NSObject

+ (void) initializeSdk;

+ (void) setHasUserConsent:(BOOL)content;

+ (void) setIsAgeRestrictedUser:(BOOL)isAge;

@end

NS_ASSUME_NONNULL_END
