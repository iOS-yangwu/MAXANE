//
//  MAXSdkManager.m
//  MAXSDK
//
//  Created by 洋吴 on 2020/9/23.
//  Copyright © 2020 洋吴. All rights reserved.
//

#import "MAXSdkManager.h"
#import <AppLovinSDK/AppLovinSDK.h>
#import "MAXAdvertANEUtils.h"


@implementation MAXSdkManager

+ (void) initializeSdk{

    [[ALSdk shared] initializeSdkWithCompletionHandler:^(ALSdkConfiguration * _Nonnull configuration) {
        
        if (configuration.consentDialogState == ALConsentDialogStateApplies) {
            
            MAXAdvertSendANEMessage(InitializedConfig, InitializedConfigCode, @"", @"");
        }
    }];
}

+ (void) setHasUserConsent:(BOOL)content{
    
    [ALPrivacySettings setHasUserConsent:content];
}

+ (void) setIsAgeRestrictedUser:(BOOL)isAge{
    
    [ALPrivacySettings setIsAgeRestrictedUser:isAge];
}


@end
