//
//  NativeAdFactoryExample.swift
//  Runner
//
//  Created by torii katsuya on 2021/03/06.
//
import Foundation
import UIKit

class NativeAdFactoryExample: FLTNativeAdFactory{
    func createNativeAd(_ nativeAd: GADUnifiedNativeAd, customOptions: [AnyHashable : Any]? = nil) -> GADUnifiedNativeAdView? {
        
        let adView = Bundle.main.loadNibNamed("UnifiedNativeAdView", owner: nil, options: nil)?.first as! GADUnifiedNativeAdView
        adView.nativeAd = nativeAd
        
        (adView.headlineView as? UILabel)?.text = nativeAd.headline
        
        (adView.bodyView as? UILabel)?.text = nativeAd.body
        adView.bodyView?.isHidden = nativeAd.body == nil
        
        (adView.callToActionView as? UIButton)?.setTitle(nativeAd.callToAction, for: .normal)
        adView.callToActionView?.isHidden = nativeAd.callToAction == nil
        
        (adView.iconView as? UIImageView)?.image = nativeAd.icon?.image
        adView.iconView?.isHidden = nativeAd.icon == nil
        
        (adView.storeView as? UILabel)?.text = nativeAd.store
        adView.storeView?.isHidden = nativeAd.store == nil
        
        (adView.priceView as? UILabel)?.text = nativeAd.price
        adView.priceView?.isHidden = nativeAd.price == nil
        
        (adView.advertiserView as? UILabel)?.text = nativeAd.advertiser
        adView.advertiserView?.isHidden = nativeAd.advertiser == nil
        
        adView.callToActionView?.isUserInteractionEnabled = false
        
        return adView
    }
}
