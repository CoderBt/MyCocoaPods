//
//  TwoViewController.swift
//  firstSwift
//
//  Created by ctios on 2018/5/8.
//  Copyright © 2018年 ctios. All rights reserved.
//

import UIKit
//import SDCycleScrollView

class TwoViewController: MyBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
       
        
        // Do any additional setup after loading the view.
        
//        let imgView = UIImageView(image: UIImage(named: "load-0"))
//        imgView.center = self.view.center
//        self.view.addSubview(imgView)
//        
//        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
//        animation.fromValue = CGFloat.pi * 2
//        animation.toValue = 0
//        animation.duration = 2
//        animation.autoreverses = false
//        animation.isRemovedOnCompletion = false;
//        animation.fillMode = kCAFillModeForwards;
//        animation.repeatCount = MAXFLOAT
//        imgView.layer.add(animation, forKey: "zlx")
//
//        let cycleScrollView:SDCycleScrollView = SDCycleScrollView.init(frame: CGRect.init(x: 0, y: 0, width: kscreenWidth, height: 150), imageNamesGroup: ["Stores","Wallet","Shopping-cart"])
        
        let cycleScrollView:SDCycleScrollView = SDCycleScrollView.init(frame: CGRect.init(x: 0, y: 0, width: kscreenWidth, height: 250), delegate: self as SDCycleScrollViewDelegate, placeholderImage: UIImage.init(named: "stores"))
        cycleScrollView.imageURLStringsGroup = ["http://img.zcool.cn/community/0142135541fe180000019ae9b8cf86.jpg@1280w_1l_2o_100sh.png","http://img.taopic.com/uploads/allimg/121019/234917-121019231h258.jpg","http://www.taopic.com/uploads/allimg/140421/318743-140421213T910.jpg"]
        self.view.addSubview(cycleScrollView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TwoViewController:SDCycleScrollViewDelegate{
    
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        FSLog(message: "\(index)")
    }

}
