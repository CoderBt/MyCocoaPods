//
//  class1.swift
//  firstSwift
//
//  Created by ctios on 2018/4/27.
//  Copyright © 2018年 ctios. All rights reserved.
//

class ZTabBarConfigure: NSObject {
   @objc func configureZTabBarController() -> UITabBarController {
        let zTabBarController: UITabBarController = UITabBarController()
        zTabBarController.tabBar.tintColor = UIColor.black
        zTabBarController.tabBar.isTranslucent = false
        
        let v1 = TypesController()
        v1.title = "Home"
        v1.tabBarItem = UITabBarItem (title: "Home", image: UIImage(named: "tabbar_HomeSelect"), selectedImage: UIImage(named: "tabbar_HomeSelected"))
        let nav1: UINavigationController = UINavigationController(rootViewController: v1)
        
        let v2 = TwoViewController()
        v2.title = "Mine"
        v2.tabBarItem = UITabBarItem.init(title: "Mine", image: UIImage.init(named: "tabbar_TargetSelect"), selectedImage: UIImage.init(named: "tabbar_TargetSelected"))
        let nav2: UINavigationController = UINavigationController(rootViewController: v2)
        
        let v3 = OtherController.init()
        v3.title = "oc"
        v3.tabBarItem = UITabBarItem.init(title: "Oc", image: UIImage.init(named: "tabbar_TargetSelect"), selectedImage: UIImage.init(named: "tabbar_TargetSelected"))
        let nav3: UINavigationController = UINavigationController(rootViewController: v3)
        
        
        let tabArr = [nav1,nav2,nav3]
        zTabBarController.viewControllers = tabArr
        
        zTabBarController.tabBar.tintColor = ColorBlue
        zTabBarController.tabBar.dk_barTintColorPicker = DKColorTable.shared().picker(withKey: "BAR")
        return zTabBarController
    }
}

