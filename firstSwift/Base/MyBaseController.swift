//
//  MyNavController.swift
//  firstSwift
//
//  Created by ctios on 2018/7/5.
//  Copyright © 2018年 ctios. All rights reserved.
//

import UIKit

class MyBaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.dk_barTintColorPicker = DKColorTable.shared().picker(withKey: "BAR")
        
        self.view.dk_backgroundColorPicker  = DKColorTable.shared().picker(withKey: "BG")
        
        // Do any additional setup after loading the view.
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
