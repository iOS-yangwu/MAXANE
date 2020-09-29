//
//  MAXAdvertANE.m
//  MAXSDK
//
//  Created by 洋吴 on 2020/9/10.
//  Copyright © 2020 洋吴. All rights reserved.
//

#import "MAXAdvertANE.h"
#import "MAXSdkManager.h"
#import "MAXInterstitialManager.h"
#import "MAXRewardVideoManager.h"
#import "MAXBannerManager.h"

#pragma mark - sdk
MAX_ANE_FUNCTION(INIT_SDK){
    
    [MAXSdkManager initializeSdk];
    return NULL;
}

MAX_ANE_FUNCTION(SET_USER_CONTENT){
    
    BOOL userContent = MAXAdvertGetBoolFromFREObject(argv[0]);
    [MAXSdkManager setHasUserConsent:userContent];
    return NULL;
}

MAX_ANE_FUNCTION(SET_IS_AGE_RESTRICT_USER){
    
    BOOL isAge = MAXAdvertGetBoolFromFREObject(argv[0]);
    [MAXSdkManager setIsAgeRestrictedUser:isAge];
    return NULL;
}

#pragma mark - interstitial
MAX_ANE_FUNCTION(LOAD_INTERSTITIAL){
    
    NSString *unitId = MAXAdvertGetStringFromFREObject(argv[0]);
    [[MAXInterstitialManager shareManager] loadAdWithUnitId:unitId];
    return NULL;
}

MAX_ANE_FUNCTION(SET_INTERSTITIAL_EXTRA_PARAMETER){
    
    NSString *key = MAXAdvertGetStringFromFREObject(argv[0]);
    NSString *value = MAXAdvertGetStringFromFREObject(argv[1]);
    [[MAXInterstitialManager shareManager]setExtraParameterForKey:key value:value];
    return NULL;
}

MAX_ANE_FUNCTION(ISREADY_INTERSTITIAL){
    
    BOOL isReady = [[MAXInterstitialManager shareManager] isReady];
    return MAXAdvertCreateFREBool(isReady);
}

MAX_ANE_FUNCTION(SHOW_INTERSTITIAL){
    
    [[MAXInterstitialManager shareManager] showAd];
    return NULL;
}

MAX_ANE_FUNCTION(SHOW_INTERSTITIAL_FOR_PLACEMENT){
    
    NSString *placement = MAXAdvertGetStringFromFREObject(argv[0]);
    [[MAXInterstitialManager shareManager] showAdForPlacement:placement];
    return NULL;
}

#pragma mark - rewardVideo
MAX_ANE_FUNCTION(LOAD_REWARDVIDEO){
    
    NSString *unitId = MAXAdvertGetStringFromFREObject(argv[0]);
    [[MAXRewardVideoManager shareManager] loadAdWithUnitId:unitId];
    return NULL;
}

MAX_ANE_FUNCTION(SET_REWARDVIDEO_EXTRA_PARAMETER){
    
    NSString *key = MAXAdvertGetStringFromFREObject(argv[0]);
    NSString *value = MAXAdvertGetStringFromFREObject(argv[1]);
    [[MAXRewardVideoManager shareManager]setExtraParameterForKey:key value:value];
    return NULL;
}

MAX_ANE_FUNCTION(ISREADY_REWARDVIDEO){
    
    BOOL isReady = [[MAXRewardVideoManager shareManager] isReady];
    return MAXAdvertCreateFREBool(isReady);
    
}

MAX_ANE_FUNCTION(SHOW_REWARDVIDEO){
    
    [[MAXRewardVideoManager shareManager] showAd];
    return NULL;
}

MAX_ANE_FUNCTION(SHOW_REWARDVIDEO_FOR_PLACEMENT){
    
    NSString *placement = MAXAdvertGetStringFromFREObject(argv[0]);
    [[MAXRewardVideoManager shareManager] showAdForPlacement:placement];
    return NULL;
}

#pragma mark - banner
MAX_ANE_FUNCTION(LOAD_BANNER){
    
    NSString *unitId = MAXAdvertGetStringFromFREObject(argv[0]);
    int align = MAXAdvertGetIntFromFREObject(argv[1]);
    [[MAXBannerManager shareManager] loadAdWithUnitId:unitId align:align];
    return NULL;
    
}

MAX_ANE_FUNCTION(SET_BANNER_EXTRA_PARAMETER){
    
    NSString *key = MAXAdvertGetStringFromFREObject(argv[0]);
    NSString *value = MAXAdvertGetStringFromFREObject(argv[1]);
    [[MAXBannerManager shareManager] setExtraParameterForKey:key value:value];
    return NULL;
}

MAX_ANE_FUNCTION(HIDE_BANNER){
    
    [[MAXBannerManager shareManager] hideBanner];
    return NULL;
}

MAX_ANE_FUNCTION(SHOW_BANNER){
    
    [[MAXBannerManager shareManager] showBanner];
    return NULL;
}

#pragma mark- FLASH
void MAXANEInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet)
{
    
    static FRENamedFunction func[] =
    {
        // sdk config
        MAX_MAP_FUNCTION(INIT_SDK, NULL),
        MAX_MAP_FUNCTION(SET_USER_CONTENT, NULL),
        MAX_MAP_FUNCTION(SET_IS_AGE_RESTRICT_USER, NULL),
        
        //interstitial
        MAX_MAP_FUNCTION(LOAD_INTERSTITIAL, NULL),
        MAX_MAP_FUNCTION(SET_INTERSTITIAL_EXTRA_PARAMETER, NULL),
        MAX_MAP_FUNCTION(ISREADY_INTERSTITIAL, NULL),
        MAX_MAP_FUNCTION(SHOW_INTERSTITIAL, NULL),
        MAX_MAP_FUNCTION(SHOW_INTERSTITIAL_FOR_PLACEMENT, NULL),
        
        //rewardVideo
        MAX_MAP_FUNCTION(LOAD_REWARDVIDEO, NULL),
        MAX_MAP_FUNCTION(SET_REWARDVIDEO_EXTRA_PARAMETER, NULL),
        MAX_MAP_FUNCTION(ISREADY_REWARDVIDEO, NULL),
        MAX_MAP_FUNCTION(SHOW_REWARDVIDEO, NULL),
        MAX_MAP_FUNCTION(SHOW_REWARDVIDEO_FOR_PLACEMENT, NULL),
        
        //banner
        MAX_MAP_FUNCTION(LOAD_BANNER,NULL),
        MAX_MAP_FUNCTION(SET_BANNER_EXTRA_PARAMETER,NULL),
        MAX_MAP_FUNCTION(HIDE_BANNER,NULL),
        MAX_MAP_FUNCTION(SHOW_BANNER,NULL)
    };
    
    *numFunctionsToTest = sizeof(func) / sizeof(FRENamedFunction);
    *functionsToSet = func;
    MAXANEEventContext = ctx;
    
}

void MAXANEFinalizer(FREContext ctx) {
    // clean
}

void MAXANEExtensionInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet) {
    *extDataToSet = NULL;
    *ctxInitializerToSet = &MAXANEInitializer;
    *ctxFinalizerToSet = &MAXANEFinalizer;
}

void MAXANEExtensionFinalizer(void* extData) {
    // clean
}

