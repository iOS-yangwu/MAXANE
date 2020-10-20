#!/bin/sh

rm -rf tmp
rm -f MAXAdvert.ane

RootPath=$(cd "$(dirname "$0")"; pwd)
echo $RootPath

mkdir tmp
cp -r ../Lib/bin/MAXAdvertLib.swc  tmp


# Admob
cp -r ../ex/iOS/MAXSDK/MAXSDK/ThirdLib/Admob/AppLovinMediationGoogleAdapter.framework tmp
cp -r ../ex/iOS/MAXSDK/MAXSDK/ThirdLib/Admob/GoogleMobileAds.framework tmp
cp -r ../ex/iOS/MAXSDK/MAXSDK/ThirdLib/Admob/PersonalizedAdConsent.framework tmp
Admob="AppLovinMediationGoogleAdapter.framework GoogleMobileAds.framework PersonalizedAdConsent.framework"

# Applovin
cp -r ../ex/iOS/MAXSDK/MAXSDK/ThirdLib/Applovin/AppLovinSDK.framework tmp
cp -r ../ex/iOS/MAXSDK/MAXSDK/ThirdLib/Applovin/AppLovinSDKResources.bundle tmp
Applovin="AppLovinSDK.framework AppLovinSDKResources.bundle"

# Facebook
cp -r ../ex/iOS/MAXSDK/MAXSDK/ThirdLib/Facebook/AppLovinMediationFacebookAdapter.framework tmp
cp -r ../ex/iOS/MAXSDK/MAXSDK/ThirdLib/Facebook/FBAudienceNetwork.framework tmp
cp -r ../ex/iOS/MAXSDK/MAXSDK/ThirdLib/Facebook/FBAudienceNetworkBiddingKit.framework tmp
cp -r ../ex/iOS/MAXSDK/MAXSDK/ThirdLib/Facebook/FBSDKCoreKit.framework tmp
Facebook="AppLovinMediationFacebookAdapter.framework FBAudienceNetwork.framework FBAudienceNetworkBiddingKit.framework FBSDKCoreKit.framework"

# IronSource
cp -r ../ex/iOS/MAXSDK/MAXSDK/ThirdLib/IronSource/AppLovinMediationIronSourceAdapter.framework tmp
cp -r ../ex/iOS/MAXSDK/MAXSDK/ThirdLib/IronSource/IronSource.framework tmp
IronSource="AppLovinMediationIronSourceAdapter.framework IronSource.framework"

# Pangle
cp -r ../ex/iOS/MAXSDK/MAXSDK/ThirdLib/Pangle/AppLovinMediationByteDanceAdapter.framework tmp
cp -r ../ex/iOS/MAXSDK/MAXSDK/ThirdLib/Pangle/BUAdSDK.bundle tmp
cp -r ../ex/iOS/MAXSDK/MAXSDK/ThirdLib/Pangle/BUAdSDK.framework tmp
cp -r ../ex/iOS/MAXSDK/MAXSDK/ThirdLib/Pangle/BUFoundation.framework tmp
Pangle="AppLovinMediationByteDanceAdapter.framework BUAdSDK.bundle BUAdSDK.framework BUFoundation.framework"

# UnityAds
cp -r ../ex/iOS/MAXSDK/MAXSDK/ThirdLib/UnityAds/AppLovinMediationUnityAdsAdapter.framework tmp
cp -r ../ex/iOS/MAXSDK/MAXSDK/ThirdLib/UnityAds/UnityAds.framework tmp
UnityAds="AppLovinMediationUnityAdsAdapter.framework UnityAds.framework"

# Vungle
#cp -r ../ex/iOS/MAXSDK/MAXSDK/ThirdLib/Vungle/AppLovinMediationVungleAdapter.framework tmp
#cp -r ../ex/iOS/MAXSDK/MAXSDK/ThirdLib/Vungle/VungleSDK.framework tmp
#Vungle="AppLovinMediationVungleAdapter.framework VungleSDK.framework"

# Nend
cp -r ../ex/iOS/MAXSDK/MAXSDK/ThirdLib/Nend/AppLovinMediationNendAdapter.framework tmp
cp -r ../ex/iOS/MAXSDK/MAXSDK/ThirdLib/Nend/NendAd.framework tmp
cp -r ../ex/iOS/MAXSDK/MAXSDK/ThirdLib/Nend/NendAdResource.bundle tmp
Nend="AppLovinMediationNendAdapter.framework NendAd.framework NendAdResource.bundle"

# Maio
cp -r ../ex/iOS/MAXSDK/MAXSDK/ThirdLib/Maio/AppLovinMediationMaioAdapter.framework tmp
cp -r ../ex/iOS/MAXSDK/MAXSDK/ThirdLib/Maio/Maio.framework tmp
Maio="AppLovinMediationMaioAdapter.framework Maio.framework "

cp ./ios/libMAXSDK.a tmp

cd tmp


pathString="${Admob} ${Applovin} ${Facebook} ${IronSource} ${Pangle} ${UnityAds} ${Nend} ${Maio}"

unzip ./MAXAdvertLib.swc

#iOS
adt -package -target ane ../MAXAdvert.ane ../extension.xml -swc MAXAdvertLib.swc -platform iPhone-ARM -platformoptions ../platformoptions.xml library.swf ${pathString} libMAXSDK.a


cd ..


rm -rf tmp
