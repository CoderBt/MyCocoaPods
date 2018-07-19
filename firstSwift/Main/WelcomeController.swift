//
//  WelcomeController.swift
//  firstSwift
//
//  Created by ctios on 2018/5/31.
//  Copyright © 2018年 ctios. All rights reserved.
//

import UIKit
import paper_onboarding

class WelcomeController: UIViewController {

    
    var skipButton: UIButton!
    
    private static let titlefont = UIFont(name: "Nunito-Bold", size: 20)
    private static let descriptionFont = UIFont(name: "OpenSans", size: 15)!
    
    
    fileprivate let items = [
        OnboardingItemInfo(informationImage: UIImage.init(named: "Key")!,
                           title: "Key",
                           description: "All hotels and hostels are sorted by hospitality rating",
                           pageIcon: UIImage.init(named: "Key")!,
                           color: UIColor.clear,
                           titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titlefont!, descriptionFont: descriptionFont),
        
        OnboardingItemInfo(informationImage: UIImage.init(named: "Wallet")!,
                           title: "Wallet",
                           description: "",
                           pageIcon: UIImage.init(named: "Wallet")!,
                           color: UIColor.clear,
                           titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titlefont!, descriptionFont: descriptionFont),
        
        OnboardingItemInfo(informationImage: UIImage.init(named: "Shopping-cart")!,
                           title: "Shopping-cart",
                           description: "All local stores are categorized for your convenience",
                           pageIcon: UIImage.init(named: "Shopping-cart")!,
                           color: UIColor.clear,
                           titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titlefont!, descriptionFont: descriptionFont),
        
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.layer.contents = UIImage.init(named: "loginBg")?.cgImage
        
        skipButton = UIButton.init()
        self.view.addSubview(skipButton!)
        skipButton.backgroundColor = UIColor.clear
        skipButton.setTitleColor(UIColor.white, for: .normal)
        skipButton.setTitle("skip", for: .normal)
        skipButton.titleLabel?.font = UIFont.init(name: "Nunito-Bold", size: 20)
        skipButton.isHidden = true
        skipButton .addTarget(self, action: #selector(self.skipClick), for: .touchUpInside)
        
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addConstraint(NSLayoutConstraint(item: skipButton, attribute: .right, relatedBy: .equal,
                                              toItem: self.view, attribute: .right,
                                              multiplier: 1, constant: -5))
        self.view.addConstraint(NSLayoutConstraint(item: skipButton, attribute: .top, relatedBy: .equal,
                                                   toItem: self.view, attribute: .top,
                                                   multiplier: 1, constant: 30))
        self.view.addConstraint(NSLayoutConstraint(item: skipButton, attribute: .width, relatedBy: .equal,
                                                   toItem: nil, attribute: .notAnAttribute,
                                                   multiplier: 1, constant: 80))
        self.view.addConstraint(NSLayoutConstraint(item: skipButton, attribute: .height, relatedBy: .equal,
                                              toItem: nil, attribute: .notAnAttribute,
                                              multiplier: 1, constant: 30))
        
        setupPaperOnboardingView()
        // Do any additional setup after loading the view.
        
        self.view.bringSubview(toFront: skipButton!)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UserDefaults.standard.set(false, forKey: "ShowGuide")
    }
    
    @objc func skipClick(_ button:UIButton) {
        
        myAppdelegate.window?.rootViewController = myAppdelegate.zTabBarController
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    private func setupPaperOnboardingView() {
        let onboarding = PaperOnboarding()
        onboarding.delegate = self
        onboarding.dataSource = self
        onboarding.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(onboarding)
        
        // Add constraints
        for attribute: NSLayoutAttribute in [.left, .right, .top, .bottom] {
            let constraint = NSLayoutConstraint(item: onboarding,
                                                attribute: attribute,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: attribute,
                                                multiplier: 1,
                                                constant: 0)
            view.addConstraint(constraint)
        }

    }
}
        // MARK: PaperOnboardingDataSource
        
        extension WelcomeController: PaperOnboardingDataSource {
            
            func onboardingItem(at index: Int) -> OnboardingItemInfo {
                return items[index]
            }
            
            func onboardingItemsCount() -> Int {
                return 3
            }
            
            //    func onboardinPageItemRadius() -> CGFloat {
            //        return 2
            //    }
            //
            //    func onboardingPageItemSelectedRadius() -> CGFloat {
            //        return 10
            //    }
            //    func onboardingPageItemColor(at index: Int) -> UIColor {
            //        return [UIColor.white, UIColor.red, UIColor.green][index]
            //    }
        }
        

extension WelcomeController: PaperOnboardingDelegate {
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        
        if index == 0{
            self.view.layer.contents = UIImage.init(named: "login_bg1")?.cgImage
        }
        else if index == 1{
            self.view.layer.contents = UIImage.init(named: "loginBg")?.cgImage
        }
        
        else if index == 2{
            self.view.layer.contents = UIImage.init(named: "loginBg")?.cgImage
            
        }
        
        skipButton?.isHidden = index == 2 ? false : true
    }
    
    func onboardingDidTransitonToIndex(_: Int) {
    }
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
//        item.titleLabel?.backgroundColor = UIColor.red
//        item.descriptionLabel?.backgroundColor = UIColor.green
//        item.imageView?.image = UIImage()
    }
}

