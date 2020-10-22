# MAXANE
## Integration
### Add your AppLovin SDK Key
Go to your Project Settings. Select Info, click on one of the rows of Custom iOS Properties and click the + to add a new row. The key of the new row key should be AppLovinSdkKey
and it should have your SDK key value
e.g: 
<key>AppLovinSdkKey</key><string>MziT8gS2aacKcumsF6qUd7ZPa1xoZ07xzqT5Vx84WlP8dX</string>
### Initialize the SDK
	MAXAdvert.initSDK();
### Interstitial Ads
#### Loading an interstitial ad
To load an interstitial ad, instantiate an  MAXAdvert object with your ad unit and call  loadAd. You should implement  delegate to be notified of when your ad is ready and other ad events.

         

	//delegate (optional)
	MAXAdvert.getInstance().setInterstitialDidLoadListener(interstitialDidLoadCallback);
	MAXAdvert.getInstance().setInterstitialFailToLoadListener(interstitialFailToLoadCallback);
	MAXAdvert.getInstance().setInterstitialDisplayListener(interstitialDisPlayCallback);
	MAXAdvert.getInstance().setInterstitialHideListener(interstitialHideCallback);
	MAXAdvert.getInstance().setInterstitialClickListener(interstitialClickCallback);
	MAXAdvert.getInstance().setInterstitialFailToDisplayListener(interstitialFailToPlayCallback);

	MAXAdvert.loadInterstitial(unitId);

	public function interstitialHideCallback():void{
	// continue game
	// reloadInterstitial
	}

#### Showing an interstitial ad
	if (MAXAdvert.isReadyInterstitial()) {
	    MAXAdvert.showInterstitial();
	} 
     
### Rewarded Ads
#### Loading a rewarded ad
To load a rewarded ad, retrieve a MAXAdvert with your rewarded ad unit and call loadRewardVideo. You should implement delegate be notified of when your ad is ready and other ad events.



	//delegate (optional)
	 MAXAdvert.getInstance().setRewardVideoDidLoadListener(videoDidLoadCallback);
	 MAXAdvert.getInstance().setRewardVideoFailToLoadListener(videoFailToLoadCallback);
	 MAXAdvert.getInstance().setRewardVideoDisplayListener(videoDisPlayCallback);
	 MAXAdvert.getInstance().setRewardVideoHideListener(videoHideCallback);
	 MAXAdvert.getInstance().setRewardVideoClickListener(videoClickCallback);
	 MAXAdvert.getInstance().setRewardVideoFailToDisplayListener(videoFailToPlayCallback);
	 MAXAdvert.getInstance().setRewardVideoDidCompleteListener(videoDidCompleteCallback);
	 MAXAdvert.getInstance().setRewardVideoDidRewardListener(videoDidRewardCallback);
	 MAXAdvert.getInstance().setRewardVideoDidStartListener(videoDidStartCallback);

	 MAXAdvert.loadRewardVideo(unitId);
	 public function videoHideCallback():void{
	    // continue game
		// reloadVideo
	  }

#### Showing a rewarded ad

	if(MAXAdvert.isReadyRewardVideo()){
	    MAXAdvert.showRewardVideo();
	}


### Banners
#### Loading and showing banners
          
	/*
	BannerAlign:
	public static const BannerAlignLeft:int = 1 << 0;    			
	public static const BannerAlignHorizontalCenter:int = 1<<1; 	
	public static const BannerAlignRight:int = 1<<2; 			
	public static const BannerAlignTop:int = 1<<3; 				
	public static const BannerAlignVerticalCenter:int = 1<<4; 		
	public static const BannerAlignBottom :int = 1<<5; 	
	*/	

	//delegate (optional)
	MAXAdvert.getInstance().setBannerDidLoadListener(bannerDidLoadCallback);
	MAXAdvert.getInstance().setBannerFailToLoadListener(bannerFailToLoadCallback);
	MAXAdvert.getInstance().setBannerDisplayListener(bannerDisPlayCallback);
	MAXAdvert.getInstance().setBannerHideListener(bannerHideCallback);
	MAXAdvert.getInstance().setBannerClickListener(bannerClickCallback);
	MAXAdvert.getInstance().setBannerFailToDisplayListener(bannerFailToDisplayCallback);
	MAXAdvert.getInstance().setBannerDidCollapseListener(bannerDidCollapseCallback);
	MAXAdvert.getInstance().setBannerDidExpandAdListener(bannerDidExpandAdCallback);

	MAXAdvert.loadBanner(bannerUnitId,MAXPrivateConst.BannerAlignBottom | MAXPrivateConst.BannerAlignHorizontalCenter);


#### To hide a banner, call the following:
	MAXAdvert.hideBanner();
#### To show a banner, call the following:
	MAXAdvert.showBanner();
### Privacy
The AppLovin SDK requires that publishers set a flag indicating whether a user located in the European Union, European Economic Area, United Kingdom, and Switzerland (collectively, the "European Countries") has provided opt-in consent for the collection and use of personal data for interest-based advertising. In addition to facilitating GDPR compliance, this framework also enables publishers to comply with certain California privacy requirements and various children data restrictions under GDPR, COPPA and App Store policies (see the "Children Data" sections below, respectively).
#### General Data Protection Regulation ("GDPR")
We recommend using the AppLovin SDK configuration object to determine if the user should be prompted for a consent dialog in the European Countries once AppLovin SDK is initialized. If the user is located in the European Countries, AppLovin will consider that GDPR applies to that user and the user should be prompted with a consent dialogue.

	//before you initSDK, you should implement this delegate
	MAXAdvert.getInstance().setInitializeSdkFinishBlockListener(showUserConsentDialog);

If the user has consented, please set the following flag to "true" and start requesting ads. Once the consent value is set, AppLovin will treat it accordingly for the lifetime of that application or until consent has been revoked.
        
	MAXAdvert.setHasUserConsent(true);

If the user has not consented, please set the following flag to "false" and start requesting ads. Once the consent value is set, AppLovin will treat it accordingly for the lifetime of that application or until consent value has changed.

	MAXAdvert.setHasUserConsent(false);
For users outside the European Countries, this flag is not required to be set in the SDK and if set, will not impact how the ad is served to such non-European Countries users.
To ensure that user consent has been set correctly, the AppLovin SDK device logs the privacy states upon initialization.
The "Has User Consent" value will be either "true" or "false" if it was correctly set. Otherwise, it will have a value of "No value set". Note that Once the consent value is set, AppLovin will treat it accordingly for the lifetime of that application or until consent value has changed.

### Children Data
iOS Apps in the "Kids" category or iOS Apps intended for children may not use the AppLovin SDK per App Store Review Guidelines 1.3 and 5.1.4.
To ensure COPPA, GDPR, and Google Play policy compliance, you should indicate when a user is a child. If the user is known to be in an age-restricted category (i.e., under the age of 16) please set the following flag to "true".

	MAXAdvert.setIsAgeRestrictedUser(true);

If the user is known not to be in an age-restricted category (i.e., age 16 or older) please set the following flag to "false".
        
	MAXAdvert.setIsAgeRestrictedUser(false);
