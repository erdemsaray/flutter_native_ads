import UIKit
import Flutter
import google_mobile_ads

@objc class ListTileNativeAdFactory : NSObject, FLTNativeAdFactory {
    @objc public func createNativeAd(_ nativeAd: GADNativeAd,
                       customOptions: [AnyHashable : Any]? = nil) -> GADNativeAdView? {
        let nibView = Bundle.main.loadNibNamed("ListTileNativeAdView", owner: nil, options: nil)!.first
        let nativeAdView = nibView as! GADNativeAdView

        (nativeAdView.headlineView as! UILabel).text = nativeAd.headline
        
        (nativeAdView.bodyView as! UILabel).text = nativeAd.body
        nativeAdView.bodyView!.isHidden = nativeAd.body == nil
        
        if let icon = nativeAd.icon {
            (nativeAdView.iconView as! UIImageView).image = icon.image
            nativeAdView.iconView!.isHidden = false
        } else {
            nativeAdView.iconView!.isHidden = true
        }
        
        nativeAdView.nativeAd = nativeAd

        return nativeAdView
    }
}

@objc class BackgroundNativeAdFactory : NSObject, FLTNativeAdFactory {
    @objc public func createNativeAd(_ nativeAd: GADNativeAd,
                       customOptions: [AnyHashable : Any]? = nil) -> GADNativeAdView? {
        let nibView = Bundle.main.loadNibNamed("BackgroundNativeAdView", owner: nil, options: nil)!.first
        let nativeAdView = nibView as! GADNativeAdView

        (nativeAdView.headlineView as! UILabel).text = nativeAd.headline
        
        (nativeAdView.bodyView as! UILabel).text = nativeAd.body
        nativeAdView.bodyView!.isHidden = nativeAd.body == nil
        
        if let icon = nativeAd.icon {
            (nativeAdView.iconView as! UIImageView).image = icon.image
            nativeAdView.iconView!.isHidden = false
        } else {
            nativeAdView.iconView!.isHidden = true
        }
        
        nativeAdView.nativeAd = nativeAd

        return nativeAdView
    }
}

@objc class MediaNativeAdFactory : NSObject, FLTNativeAdFactory {
    @objc public func createNativeAd(_ nativeAd: GADNativeAd,
                       customOptions: [AnyHashable : Any]? = nil) -> GADNativeAdView? {
        let nibView = Bundle.main.loadNibNamed("MediaNativeAdView", owner: nil, options: nil)!.first
        let nativeAdView = nibView as! GADNativeAdView

        (nativeAdView.headlineView as! UILabel).text = nativeAd.headline
        
        (nativeAdView.bodyView as! UILabel).text = nativeAd.body
        nativeAdView.bodyView!.isHidden = nativeAd.body == nil
        
        if let icon = nativeAd.icon {
            (nativeAdView.iconView as! UIImageView).image = icon.image
            nativeAdView.iconView!.isHidden = false
        } else {
            nativeAdView.iconView!.isHidden = true
        }
        
        // Set up media view
        nativeAdView.mediaView?.mediaContent = nativeAd.mediaContent
        
        // Set up call to action button
        (nativeAdView.callToActionView as! UIButton).setTitle(nativeAd.callToAction, for: .normal)
        nativeAdView.callToActionView?.isHidden = nativeAd.callToAction == nil
        
        nativeAdView.nativeAd = nativeAd

        return nativeAdView
    }
}

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        
        // Register native ad factories
        let listTileFactory = ListTileNativeAdFactory()
        FLTGoogleMobileAdsPlugin.registerNativeAdFactory(
            self,
            factoryId: "listTile",
            nativeAdFactory: listTileFactory
        )
        
        let backgroundFactory = BackgroundNativeAdFactory()
        FLTGoogleMobileAdsPlugin.registerNativeAdFactory(
            self,
            factoryId: "nativeAdWithBackground",
            nativeAdFactory: backgroundFactory
        )
        
        let mediaFactory = MediaNativeAdFactory()
        FLTGoogleMobileAdsPlugin.registerNativeAdFactory(
            self,
            factoryId: "nativeAdMedia",
            nativeAdFactory: mediaFactory
        )

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    override func applicationWillTerminate(_ application: UIApplication) {
        // Unregister native ad factories
        FLTGoogleMobileAdsPlugin.unregisterNativeAdFactory(self, factoryId: "listTile")
        FLTGoogleMobileAdsPlugin.unregisterNativeAdFactory(self, factoryId: "nativeAdWithBackground")
        FLTGoogleMobileAdsPlugin.unregisterNativeAdFactory(self, factoryId: "nativeAdMedia")
    }
}
