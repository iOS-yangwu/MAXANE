package com.MAX.ane
{

import com.MAX.utils.MAXFunctions;
import com.MAX.utils.MAXPrivateConst;
import flash.display.MovieClip;
import flash.events.IEventDispatcher;
import flash.events.StatusEvent;
import flash.external.ExtensionContext;
//import flash.media.SoundLoaderContext;
import flash.system.Capabilities;


public class MAXAdvert extends MovieClip implements IEventDispatcher
{
	internal static var EXTENSION_ID:String = "com.MAX.ane";
	internal var extContext:ExtensionContext = null;
	internal static var instance:MAXAdvert;

	///================ set delegate ================
	// sdk
	private var initializeSdkFinishBlockListener:Function;

	//interstitial
	private var interstitialDidLoadListener:Function;
	private var interstitialFailToLoadListener:Function;
	private var interstitialDisplayListener:Function;
	private var interstitialHideListener:Function;
	private var interstitialClickListener:Function;
	private var interstitialFailToDisplayListener:Function;

	//rewardVideo
	private var rewardVideoDidLoadListener:Function;
	private var rewardVideoFailToLoadListener:Function;
	private var rewardVideoDisplayListener:Function;
	private var rewardVideoHideListener:Function;
	private var rewardVideoClickListener:Function;
	private var rewardVideoFailToDisplayListener:Function;
	private var rewardVideoDidCompleteListener:Function;
	private var rewardVideoDidRewardListener:Function;
	private var rewardVideoDidStartListener:Function;
	private var _main:MovieClip = null;

	//banner
	private var bannerDidLoadListener:Function;
	private var bannerFailToLoadListener:Function;
	private var bannerDisplayListener:Function;
	private var bannerHideListener:Function;
	private var bannerClickListener:Function;
	private var bannerFailToDisplayListener:Function;
	private var bannerDidCollapseListener:Function;
	private var bannerDidExpandAdListener:Function;

	//sdk
	public  function  setInitializeSdkFinishBlockListener(listener:Function):void{
		this.initializeSdkFinishBlockListener = listener;
	}

	//interstitial
	public  function  setInterstitialDidLoadListener(listener:Function):void{
		this.interstitialDidLoadListener = listener;
	}

	public function setInterstitialFailToLoadListener(listener:Function):void{
		this.interstitialFailToLoadListener = listener;
	}

	public function setInterstitialDisplayListener(listener:Function):void{
		this.interstitialDisplayListener = listener;
	}

	public function setInterstitialHideListener(listener:Function):void{
		this.interstitialHideListener = listener;
	}

	public function setInterstitialClickListener(listener:Function):void{
		this.interstitialClickListener = listener;
	}

	public function setInterstitialFailToDisplayListener(listener:Function):void{
		this.interstitialFailToDisplayListener = listener;
	}

	//rewardVideo
	public function setRewardVideoDidLoadListener(listener:Function):void{
		this.rewardVideoDidLoadListener = listener;
	}

	public function setRewardVideoFailToLoadListener(listener:Function):void{
		this.rewardVideoFailToLoadListener = listener;
	}

	public function setRewardVideoDisplayListener(listener:Function):void{

		this.rewardVideoDisplayListener = listener;
	}

	public function setRewardVideoHideListener(listener:Function):void{
		this.rewardVideoHideListener = listener;
	}

	public function setRewardVideoClickListener(listener:Function):void{
		this.rewardVideoClickListener = listener;

	}

	public function setRewardVideoFailToDisplayListener(listener:Function):void{
		this.rewardVideoFailToDisplayListener = listener;

	}

	public function setRewardVideoDidCompleteListener(listener:Function):void {
		this.rewardVideoDidCompleteListener = listener;
	}

	public function setRewardVideoDidRewardListener(listener:Function):void {
		this.rewardVideoDidRewardListener = listener;
	}

	public function setRewardVideoDidStartListener(listener:Function):void {
		this.rewardVideoDidStartListener = listener;
	}

	//banner
	public  function  setBannerDidLoadListener(listener:Function):void{
		this.bannerDidLoadListener = listener;
	}

	public  function  setBannerFailToLoadListener(listener:Function):void{
		this.bannerFailToLoadListener = listener;
	}

	public  function  setBannerDisplayListener(listener:Function):void{
		this.bannerDisplayListener = listener;
	}

	public  function  setBannerHideListener(listener:Function):void{
		this.bannerHideListener = listener;
	}

	public  function  setBannerClickListener(listener:Function):void{
		this.bannerClickListener = listener;
	}

	public  function  setBannerFailToDisplayListener(listener:Function):void{
		this.bannerFailToDisplayListener = listener;
	}

	public  function  setBannerDidCollapseListener(listener:Function):void{
		this.bannerDidCollapseListener = listener;
	}

	public  function  setBannerDidExpandAdListener(listener:Function):void{
		this.bannerDidExpandAdListener = listener;
	}

	///================ sdk config ================

	/**
	 * @brief  init sdk
	 */
	public static function initSDK():void{

		if (_isIOS()){

			MAXAdvert.getInstance().extContext.call(MAXFunctions.INIT_SDK);

		}else if (_isAndroid()){

		}else{

			trace("MAX-Function-initSDK-Not a Android/iOS module");
		}
	}

	/**
	 * @brief setHasUserConsent
	 */
	public static function setHasUserConsent(content:Boolean):void{

		if (_isIOS()){

			MAXAdvert.getInstance().extContext.call(MAXFunctions.SET_USER_CONTENT,content);

		}else if (_isAndroid()){

		}else{

			trace("MAX-Function-setHasUserConsent-Not a Android/iOS module");
		}
	}

	/**
	 * @brief setIsAgeRestrictedUser
	 */
	public static function setIsAgeRestrictedUser(isAge:Boolean):void{

		if (_isIOS()){

			MAXAdvert.getInstance().extContext.call(MAXFunctions.SET_IS_AGE_RESTRICT_USER,isAge);

		}else if (_isAndroid()){

		}else{

			trace("MAX-Function-setIsAgeRestrictedUser-Not a Android/iOS module");
		}
	}

	/**
	 * @brief loadInterstitial
	 */
	public static function loadInterstitial(unitId:String):void{
		if (_isIOS()){

			var sdkVersion:String = String(MAXAdvert.getInstance().extContext.call(MAXFunctions.LOAD_INTERSTITIAL,unitId));

		}else if (_isAndroid()){

		}else{

			trace("MAX-Function-loadInterstitial-Not a Android/iOS module");
		}
	}

	/**
	 *  @brief setInterstitialExtraParameter
	 */
	public static function setInterstitialExtraParameter(key:String,value:String):void{
		if (_isIOS()){

			MAXAdvert.getInstance().extContext.call(MAXFunctions.SET_INTERSTITIAL_EXTRA_PARAMETER,key,value);

		}else if (_isAndroid()){

		}else{

			trace("MAX-Function-setInterstitialExtraParameter-Not a Android/iOS module");
		}
	}

	/**
	 *  @brief isReadyInterstitial
	 */
	public static function isReadyInterstitial():Boolean{

		if (_isIOS()){

			return MAXAdvert.getInstance().extContext.call(MAXFunctions.ISREADY_INTERSTITIAL);

		}else if (_isAndroid()){

			return false
		}else{

			trace("MAX-Function-isReadyInterstitial-Not a Android/iOS module");
			return false;
		}
	}

	/**
	 * @brief showInterstitial
	 */
	public static function showInterstitial():void{

		if (_isIOS()){

			MAXAdvert.getInstance().extContext.call(MAXFunctions.SHOW_INTERSTITIAL);

		}else if (_isAndroid()){

		}else{

			trace("MAX-Function-showInterstitial-Not a Android/iOS module");
		}
	}

	/**
	 * @brief showInterstitialForPlacement
	 */
	public static function showInterstitialForPlacement(placement:String):void{

		if (_isIOS()){

			MAXAdvert.getInstance().extContext.call(MAXFunctions.SHOW_INTERSTITIAL_FOR_PLACEMENT,placement);

		}else if (_isAndroid()){


		}else{

			trace("MAX-Function-showInterstitialForPlacement-Not a Android/iOS module");
		}
	}

	/**
	 * @brief loadRewardVideo
	 */
	public static function loadRewardVideo(unitId:String):void{

		if (_isIOS()){
			var ABSDKVersion:String = String(MAXAdvert.getInstance().extContext.call(MAXFunctions.LOAD_REWARDVIDEO,unitId));

		}else if (_isAndroid()){


		}else{

			trace("MAX-Function-loadRewardVideo-Not a Android/iOS module");
		}
	}

	/**
	 * @brief setRewardVideoExtraParameter
	 */
	public static function setRewardVideoExtraParameter(key:String,value:String):void{

		if (_isIOS()){

			MAXAdvert.getInstance().extContext.call(MAXFunctions.SET_REWARDVIDEO_EXTRA_PARAMETER,key,value);

		}else if (_isAndroid()){

		}else{

			trace("MAX-Function-setRewardVideoExtraParameter-Not a Android/iOS module");
		}
	}

	/**
	 * @brief isReadyRewardVideo
	 */
	public static function isReadyRewardVideo():Boolean{

		if (_isIOS()){

			return MAXAdvert.getInstance().extContext.call(MAXFunctions.ISREADY_REWARDVIDEO);

		}else if (_isAndroid()){

			return false;

		}else{

			trace("MAX-Function-isReadyRewardVideo-Not a Android/iOS module");
			return false;
		}
	}

	/**
	 * @brief showRewardVideo
	 */
	public static function showRewardVideo():void{

		if (_isIOS()){

			MAXAdvert.getInstance().extContext.call(MAXFunctions.SHOW_REWARDVIDEO);

		}else if (_isAndroid()){

		}else{

			trace("MAX-Function-showRewardVideo-Not a Android/iOS module");

		}
	}

	/**
	 * @brief showRewardVideoForPlacement
	 */
	public static function showRewardVideoForPlacement(placement:String):void{

		if (_isIOS()){

			MAXAdvert.getInstance().extContext.call(MAXFunctions.SHOW_REWARDVIDEO_FOR_PLACEMENT,placement);

		}else if (_isAndroid()){


		}else{

			trace("MAX-Function-showRewardVideoForPlacement-Not a Android/iOS module");
		}
	}

	/**
	 * @brief loadBanner
	 */
	public static function loadBanner(unitId:String,align:int):void{

		if (_isIOS()){

			MAXAdvert.getInstance().extContext.call(MAXFunctions.LOAD_BANNER,unitId,align);

		}else if (_isAndroid()){


		}else{

			trace("MAX-Function-loadBanner-Not a Android/iOS module");
		}
	}

	/**
	 * @brief setBannerExtraParameter
	 */
	public static function setBannerExtraParameter(key:String,value:String):void{

		if (_isIOS()){

			MAXAdvert.getInstance().extContext.call(MAXFunctions.SET_BANNER_EXTRA_PARAMETER,key,value);

		}else if (_isAndroid()){


		}else{

			trace("MAX-Function-setBannerExtraParameter-Not a Android/iOS module");
		}
	}

	/**
	 * @brief hideBanner
	 */
	public static function hideBanner():void{

		if (_isIOS()){

			MAXAdvert.getInstance().extContext.call(MAXFunctions.HIDE_BANNER);

		}else if (_isAndroid()){


		}else{

			trace("MAX-Function-hideBanner-Not a Android/iOS module");
		}
	}

	/**
	 * @brief showBanner
	 */
	public static function showBanner():void{

		if (_isIOS()){

			MAXAdvert.getInstance().extContext.call(MAXFunctions.SHOW_BANNER);

		}else if (_isAndroid()){


		}else{

			trace("MAX-Function-showBanner-Not a Android/iOS module");
		}
	}

	private static var sFunctionTicker:int;
	private static var sFunctionMap:Object = new Object();
	public static function functionToString(name:String,f:Function,singleInstance:Boolean):String{
		if(singleInstance){
			sFunctionMap[name] = f;
			return f == null ? null : name;
		}else{
			var key:String = sFunctionTicker + "";
			sFunctionMap[key] = f;
			sFunctionTicker ++;
			return  f == null ? null : key;
		}
	}


	public function nativeCallBack(e:StatusEvent):void {

		trace("MAX SDK code:" + e.code + "  level:"+  e.level);

		var code:String = e.code;

		var json:String = e.level;

		var resp:Object = JSON.parse(json);

		var action:int = resp.what;

		var verify:String=resp.verify;

		switch(action){
			case MAXPrivateConst.InitializedConfig:
			{
				if(this.initializeSdkFinishBlockListener != null){
					this.initializeSdkFinishBlockListener();
				}
			}
				break;

			//interstitial
			case MAXPrivateConst.InterstitialDidLoad:
			{
				if(this.interstitialDidLoadListener != null){
					this.interstitialDidLoadListener();
				}
			}
				break;

			case MAXPrivateConst.InterstitialFailToLoad:
			{
				if(this.interstitialFailToLoadListener != null){
					this.interstitialFailToLoadListener();
				}
			}
				break;

			case MAXPrivateConst.InterstitialDisplay:
			{
				if(this.interstitialDisplayListener != null){
					this.interstitialDisplayListener();
				}
			}
				break;

			case MAXPrivateConst.InterstitialHide:
			{
				if(this.interstitialHideListener != null){
					this.interstitialHideListener();
				}
			}
				break;

			case MAXPrivateConst.InterstitialClick:
			{
				if(this.interstitialClickListener != null){
					this.interstitialClickListener();
				}
			}
				break;

			case MAXPrivateConst.InterstitialFailToDisplay:
			{
				if(this.interstitialFailToDisplayListener != null){
					this.interstitialFailToDisplayListener();
				}
			}
				break;

			//rewardVideo
			case MAXPrivateConst.RewardVideoDidLoad:
			{
				if(this.rewardVideoDidLoadListener != null){
					this.rewardVideoDidLoadListener();
				}
			}
				break;

			case MAXPrivateConst.RewardVideoFailToLoad:
			{
				if(this.rewardVideoFailToLoadListener != null){
					this.rewardVideoFailToLoadListener();
				}
			}
				break;

			case MAXPrivateConst.RewardVideoDisplay:
			{
				if(this.rewardVideoDisplayListener != null){
					this.rewardVideoDisplayListener();
				}
			}
				break;

			case MAXPrivateConst.RewardVideoHide:
			{
				if(this.rewardVideoHideListener != null){
					this.rewardVideoHideListener();
				}
			}
				break;

			case MAXPrivateConst.RewardVideoClick:
			{
				if(this.rewardVideoClickListener != null){
					this.rewardVideoClickListener(verify);
				}
			}
				break;
			case MAXPrivateConst.RewardVideoFailToDisplay:
			{
				if(this.rewardVideoFailToDisplayListener != null){
					this.rewardVideoFailToDisplayListener();
				}
			}
				break;

			case MAXPrivateConst.RewardVideoDidComplete:
			{
				if(this.rewardVideoDidCompleteListener != null){
					this.rewardVideoDidCompleteListener();
				}
			}
				break;

			case MAXPrivateConst.RewardVideoDidReward:
			{
				if(this.rewardVideoDidRewardListener != null){
					this.rewardVideoDidRewardListener();
				}
			}
				break;

			case MAXPrivateConst.RewardVideoDidStart:{
				if(this.rewardVideoDidStartListener != null){
					this.rewardVideoDidStartListener();
				}

			}
				break;

			//banner
			case MAXPrivateConst.BannerDidLoad:{
				if(this.bannerDidLoadListener != null){
					this.bannerDidLoadListener();
				}
			}
				break;

			case MAXPrivateConst.BannerFailToLoad:{
				if(this.bannerFailToLoadListener != null){
					this.bannerFailToLoadListener();
				}
			}
				break;

			case MAXPrivateConst.BannerDisplay:{
				if(this.bannerDisplayListener != null){
					this.bannerDisplayListener();
				}
			}
				break;

			case MAXPrivateConst.BannerHide:{
				if(this.bannerHideListener != null){
					this.bannerHideListener();
				}
			}
				break;

			case MAXPrivateConst.BannerClick:{
				if(this.bannerClickListener != null){
					this.bannerClickListener();
				}
			}
				break;

			case MAXPrivateConst.BannerFailToDisplay:{
				if(this.bannerFailToDisplayListener != null){
					this.bannerFailToDisplayListener();
				}
			}
				break;

			case MAXPrivateConst.BannerDidCollapse:{
				if(this.bannerDidCollapseListener != null){
					this.bannerDidCollapseListener();
				}
			}
				break;

			case MAXPrivateConst.BannerDidExpandAd:{
				if(this.bannerDidExpandAdListener != null){
					this.bannerDidExpandAdListener();
				}
			}
				break;
		}
	}

	public function MAXAdvert(){
		if (!extContext) {
			extContext = ExtensionContext.createExtensionContext(EXTENSION_ID, null);
			if(extContext == null){
				trace("MAX createExtensionContext error");
			}
			extContext.addEventListener( StatusEvent.STATUS, nativeCallBack);
		}
	}

	public static function getInstance():MAXAdvert {
		if(instance == null)
			instance = new MAXAdvert();
		return instance;
	}

	private static function _isIOS():Boolean {
		return Capabilities.manufacturer.indexOf("iOS") > -1 && Capabilities.os.indexOf("x86_64") < 0 && Capabilities.os.indexOf("i386") < 0;
	}

	private static function _isAndroid():Boolean {

		return Capabilities.manufacturer.indexOf("Android") > -1;
	}

	public  function setMain(main:MovieClip):void {
		this._main = main;
	}
}
}