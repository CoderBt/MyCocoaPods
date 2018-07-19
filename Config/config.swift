//
//  File.swift
//  firstSwift
//
//  Created by ctios on 2018/5/9.
//  Copyright © 2018年 ctios. All rights reserved.
//

import UIKit

let myAppdelegate = UIApplication.shared.delegate as! AppDelegate

let kscreenWidth = UIScreen.main.bounds.size.width
let kscreenHeight = UIScreen.main.bounds.size.height
let AESSECRETKEY = "CTTC-UGO"


@objc enum Bear: Int {
    case Black, Grizzly, Polar
}


//color
let myBlueColor11 = UIColor(red: 55/255, green: 186/255, blue: 89/255, alpha: 0.5)

//UIColorFromRGB(rgbValue: 0x529af5)
let ColorBlue = UIColor(hex:"#23A8F9")
let ColorDeepBlue = UIColorFromRGB(rgbValue: 0x366eb3)


func UIColorFromRGB(rgbValue: UInt) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}


 func FSLog<T>(message: T)
{
    #if DEBUG
    print("\(message)")
    
    #endif
}


//func DKColorPickerWithKey(key:String) -> UIColor {
//    return  DKColorTable.shared().picker(withKey: key)
//    
//    
//}



