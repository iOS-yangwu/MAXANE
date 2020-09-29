//
//  MAXAdvertANEUtils.h
//  MAXSDK
//
//  Created by 洋吴 on 2020/9/10.
//  Copyright © 2020 洋吴. All rights reserved.
//



#import "FlashRuntimeExtensions.h"
#import <Foundation/Foundation.h>


#pragma mark - Fucntion
#define MAX_IMP_ANE_FUNCTION(f) FREObject (MAXANE_##f)(FREContext ctx, void *data, uint32_t argc, FREObject argv[])

#define MAX_IMP_MAP_FUNCTION(f, data) { (const uint8_t*)(#f), (data), &(MAXANE_##f) }

#define MAX_ANE_FUNCTION(f) MAX_IMP_ANE_FUNCTION(f)

#define MAX_MAP_FUNCTION(f, data) MAX_IMP_MAP_FUNCTION(f, data)

/// 从ANE获取参数：字符串类型
/// @param obj FREObject
/// e.g:
/// MAXAdvertGetStringFromFREObject(argv[0]); 获取第一个参数
/// MAXAdvertGetStringFromFREObject(argv[1]); 获取第二个参数
NSString *MAXAdvertGetStringFromFREObject(FREObject obj);


/// 向ANE传递参数
/// @param string NSString 类型
/// e.g :
/// MAXAdvertCreateFREString(@"1.0.0.0");
FREObject MAXAdvertCreateFREString(NSString * string);


/// 从ANE获取参数：double 类型
/// @param obj FREObject
double MAXAdvertGetDoubleFromFREObject(FREObject obj);


/// 向ANE传递参数
/// @param value double 类型
FREObject MAXAdvertCreateFREDouble(double value);


/// 从ANE获取参数：int 类型
/// @param obj FREObject
int MAXAdvertGetIntFromFREObject(FREObject obj);


/// 向ANE传递参数
/// @param value int 类型
FREObject MAXAdvertCreateFREInt(int value);


/// 从ANE获取参数：bool 类型
/// @param obj FREObject
BOOL MAXAdvertGetBoolFromFREObject(FREObject obj);


/// 向ANE传递参数
/// @param value bool 类型
FREObject MAXAdvertCreateFREBool(BOOL value);


/// obj 转 json 字符串
/// @param obj NSDictionary/NSArray
NSString *MAXAdvertObj2ANEJSON(id obj);


///向ANE发送消息（字符串）
void MAXAdvertSendANEMessage(int what,NSString *code,NSString *key,NSString *value);


///向ANE发送消息
void MAXAdvertSendANEMessageWithDict(NSDictionary *dict,NSString *code);


///向ANE发送消息
void MAXAdvertANEDispatchStatusEventAsyn(NSString  * type ,NSString *jsonString);


typedef enum {
    //sdk config
    InitializedConfig = 0,
    //interstitial
    InterstitialDidLoad,
    InterstitialFailToLoad,
    InterstitialDisplay,
    InterstitialHide,
    InterstitialClick,
    InterstitialFailToDisplay,
    //rewardVideo
    RewardVideoDidLoad = 7,
    RewardVideoFailToLoad,
    RewardVideoDisplay,
    RewardVideoHide,
    RewardVideoClick,
    RewardVideoFailToDisplay,
    RewardVideoDidComplete = 13,
    RewardVideoDidReward,
    RewardVideoDidStart,
    //banner
    BannerDidLoad,
    BannerFailToLoad,
    BannerDisplay,
    BannerHide,
    BannerClick,
    BannerFailToDisplay,
    BannerDidCollapse,
    BannerDidExpandAd
    
} MAXAdvertANEEvent;

NSString* const InitializedConfigCode = @"MAX_InitializedConfig_ALConsentDialogStateApplies";

//interstitial
NSString* const InterstitialDidLoadCode = @"MAX_InterstitialDidLoad";
NSString* const InterstitialFailToLoadCode = @"MAX_InterstitialFailToLoad";
NSString* const InterstitialDisplayCode = @"MAX_InterstitialDisplay";
NSString* const InterstitialHideCode = @"MAX_InterstitialHide";
NSString* const InterstitialClickCode = @"MAX_InterstitialClick";
NSString* const InterstitialFailToDisplayCode = @"MAX_InterstitialFailToDisplay";

//rewardVideo
NSString* const RewardVideoDidLoadCode = @"MAX_RewardVideoDidLoad";
NSString* const RewardVideoFailToLoadCode = @"MAX_RewardVideoFailToLoad";
NSString* const RewardVideoDisplayCode = @"MAX_RewardVideoDisplay";
NSString* const RewardVideoHideCode = @"MAX_RewardVideoHide";
NSString* const RewardVideoClickCode = @"MAX_RewardVideoClick";
NSString* const RewardVideoFailToDisplayCode = @"MAX_RewardVideoFailToDisplay";
NSString* const RewardVideoDidCompleteCode = @"rewardVideoDidComplete";
NSString* const RewardVideoDidRewardCode = @"MAX_RewardVideoDidReward";
NSString* const RewardVideoDidStartCode = @"MAX_RewardVideoDidStart";

//banner
NSString* const BannerDidLoadCode = @"MAX_BannerDidLoad";
NSString* const BannerFailToLoadCode = @"MAX_BannerFailToLoad";
NSString* const BannerDisplayCode = @"MAX_BannerDisplay";
NSString* const BannerHideCode = @"MAX_BannerHide";
NSString* const BannerClickCode = @"MAX_BannerClick";
NSString* const BannerFailToDisplayCode = @"MAX_BannerFailToDisplay";
NSString* const BannerDidCollapseCode = @"MAX_BannerDidCollapse";
NSString* const BannerDidExpandAdCode = @"MAX_BannerDidExpandAd";
