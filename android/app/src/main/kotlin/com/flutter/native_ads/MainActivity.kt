package com.flutter.native_ads

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        // Register the native ad factories
        GoogleMobileAdsPlugin.registerNativeAdFactory(
            flutterEngine,
            "listTile",
            NativeAdFactory(context)
        )

        GoogleMobileAdsPlugin.registerNativeAdFactory(
            flutterEngine,
            "nativeAdWithBackground",
            NativeAdWithBackgroundFactory(context)
        )

        GoogleMobileAdsPlugin.registerNativeAdFactory(
            flutterEngine,
            "nativeAdMedia",
            NativeAdMediaFactory(context)
        )
    }

    override fun cleanUpFlutterEngine(flutterEngine: FlutterEngine) {
        super.cleanUpFlutterEngine(flutterEngine)
        
        // Unregister the native ad factories
        GoogleMobileAdsPlugin.unregisterNativeAdFactory(flutterEngine, "listTile")
        GoogleMobileAdsPlugin.unregisterNativeAdFactory(flutterEngine, "nativeAdWithBackground")
        GoogleMobileAdsPlugin.unregisterNativeAdFactory(flutterEngine, "nativeAdMedia")
    }
}
