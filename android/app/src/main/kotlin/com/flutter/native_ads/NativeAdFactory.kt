package com.flutter.native_ads

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.widget.ImageView
import android.widget.TextView
import android.widget.Button
import com.google.android.gms.ads.nativead.MediaView
import com.google.android.gms.ads.nativead.NativeAd
import com.google.android.gms.ads.nativead.NativeAdView
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin
import com.flutter.native_ads.R

class NativeAdFactory(private val context: Context) : GoogleMobileAdsPlugin.NativeAdFactory {
    override fun createNativeAd(
        nativeAd: NativeAd,
        customOptions: MutableMap<String, Any>?
    ): NativeAdView {
        val nativeAdView = LayoutInflater.from(context)
            .inflate(R.layout.native_ad, null) as NativeAdView

        with(nativeAdView) {
            val headlineView = findViewById<TextView>(R.id.ad_headline)
            val bodyView = findViewById<TextView>(R.id.ad_body)
            val iconView = findViewById<ImageView>(R.id.ad_app_icon)

            headlineView.text = nativeAd.headline
            bodyView.text = nativeAd.body
            iconView.setImageDrawable(nativeAd.icon?.drawable)

            this.headlineView = headlineView
            this.bodyView = bodyView
            this.iconView = iconView
            
            setNativeAd(nativeAd)
        }

        return nativeAdView
    }
}

class NativeAdWithBackgroundFactory(private val context: Context) : GoogleMobileAdsPlugin.NativeAdFactory {
    override fun createNativeAd(
        nativeAd: NativeAd,
        customOptions: MutableMap<String, Any>?
    ): NativeAdView {
        val nativeAdView = LayoutInflater.from(context)
            .inflate(R.layout.native_ad_with_background, null) as NativeAdView

        with(nativeAdView) {
            val headlineView = findViewById<TextView>(R.id.ad_headline)
            val bodyView = findViewById<TextView>(R.id.ad_body)
            val iconView = findViewById<ImageView>(R.id.ad_app_icon)

            headlineView.text = nativeAd.headline
            bodyView.text = nativeAd.body
            iconView.setImageDrawable(nativeAd.icon?.drawable)

            this.headlineView = headlineView
            this.bodyView = bodyView
            this.iconView = iconView
            
            setNativeAd(nativeAd)
        }

        return nativeAdView
    }
}

class NativeAdMediaFactory(private val context: Context) : GoogleMobileAdsPlugin.NativeAdFactory {
    override fun createNativeAd(
        nativeAd: NativeAd,
        customOptions: MutableMap<String, Any>?
    ): NativeAdView {
        val nativeAdView = LayoutInflater.from(context)
            .inflate(R.layout.native_ad_media, null) as NativeAdView

        with(nativeAdView) {
            val headlineView = findViewById<TextView>(R.id.ad_headline)
            val bodyView = findViewById<TextView>(R.id.ad_body)
            val iconView = findViewById<ImageView>(R.id.ad_app_icon)
            val mediaView = findViewById<MediaView>(R.id.ad_media)
            val callToActionView = findViewById<Button>(R.id.ad_call_to_action)

            headlineView.text = nativeAd.headline
            bodyView.text = nativeAd.body
            iconView.setImageDrawable(nativeAd.icon?.drawable)
            callToActionView.text = nativeAd.callToAction

            this.headlineView = headlineView
            this.bodyView = bodyView
            this.iconView = iconView
            this.mediaView = mediaView
            this.callToActionView = callToActionView
            
            setNativeAd(nativeAd)
        }

        return nativeAdView
    }
}
