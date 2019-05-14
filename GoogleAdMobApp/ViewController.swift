//
//  ViewController.swift
//  GoogleAdMobApp
//
//  Created by kenneth moody on 5/14/19.
//  Copyright © 2019 Kenneth Moody Sr. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, GADInterstitialDelegate {
    
    @IBOutlet weak var bannerView: GADBannerView!
    var interstitial: GADInterstitial!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        interstitial = createInterstitial()
    }
    @IBAction func showBanner(_ sender: Any) {
        let request = GADRequest()
        request.testDevices = [ kGADSimulatorID ]
        
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(request)
        
    }
    
    @IBAction func showInterstitial(_ sender: Any) {
        
        if interstitial.isReady {
            interstitial.present(fromRootViewController: self)
        }
    }
    
    func createInterstitial() -> GADInterstitial {
        
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/5135589807")
        
        let request = GADRequest()
        request.testDevices = [ kGADSimulatorID ]
        interstitial.load(request)
        interstitial.delegate = self
        
        return interstitial
        
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        
        interstitial = createInterstitial()
    }
}

