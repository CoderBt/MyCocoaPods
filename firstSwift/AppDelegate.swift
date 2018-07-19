//
//  AppDelegate.swift
//  firstSwift
//
//  Created by ctios on 2018/4/26.
//  Copyright © 2018年 ctios. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var zTabBarController: UITabBarController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        
        
        self.setFirstConfig()
        
        self.setAppearance()
        
        let zTabBarConfigure: ZTabBarConfigure = ZTabBarConfigure()
        self.zTabBarController = zTabBarConfigure.configureZTabBarController()
        
        if UserDefaults.standard.bool(forKey: "ShowGuide"){
            let welVc:WelcomeController = WelcomeController()
            window?.rootViewController = welVc
        }
        else{
            window?.rootViewController = self.zTabBarController
        }
        
        
        EmptyPage.begin()
        
        
        return true
    }
    
    func setFirstConfig() {
        
        //引导图
        if (UserDefaults.standard.value(forKey: "ShowGuide") == nil) {
            UserDefaults.standard.set(true, forKey: "ShowGuide")
        }
        
        //新手
        if (UserDefaults.standard.value(forKey: "ShowInstruction") == nil) {
            UserDefaults.standard.set(true, forKey: "ShowInstruction")
        }
        
    }
    
    func setAppearance() {
        

        self.dk_manager.themeVersion = DKThemeVersionNormal
        

        //UINavigationBar appearance
        UINavigationBar.appearance().barTintColor = UIColor.white

        let dict:NSDictionary = [NSAttributedStringKey.foregroundColor: ColorBlue,NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 20)]
        //标题颜色
        UINavigationBar.appearance().titleTextAttributes = dict as? [NSAttributedStringKey : AnyObject]
        
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

