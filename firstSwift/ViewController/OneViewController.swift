//
//  OneViewController.swift
//  firstSwift
//
//  Created by ctios on 2018/5/8.
//  Copyright © 2018年 ctios. All rights reserved.
//

import UIKit

class OneViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    let isReal:Bool = false
    var table:UITableView!
    let arry:[String] = []

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (table.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)) as UITableViewCell
        cell.textLabel?.text = arry[indexPath.row]
        return cell
    }
    
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //设置UITableView的位置
        let rect = self.view.frame
        table = UITableView(frame: rect)
        self.table.backgroundColor = UIColor.blue
        
        //设置数据源
        self.table.dataSource = self
        //设置代理
        self.table.delegate = self
        
        //注册UITableView，cellID为重复使用cell的Identifier
        self.table.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        self.view.addSubview(table)
        
        self.table.setEmpty(view: EmptyStates.loading)
        self.request(isReal:true)
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func myFunc(_ button:UIButton) {
        
        print("button click=\(button.tag)")
        
        
        self.request(isReal: !isReal)
    }

    func request(isReal:Bool){
        
        let dic:Dictionary<String,String> = [
            "login":"18646130125",
            "os":"2",
            "clientid" : "1864613012520180521141743393",
            "version" : "1.3.7"
        ]
        
        let jsonStr = Tool.getJSONStringFromDictionary(dictionary: dic as NSDictionary)
        let crypStr:String = DataEncoding.Endcode_AES_ECB(strToEncode: jsonStr)
        let sigStr = "data=\(crypStr)&key=\(AESSECRETKEY)"
        var sig = sigStr.md5().uppercased()
        
        
        if !isReal{
            sig = ""
        }
        
        
        UgoPersonProvider.request(.version(d:crypStr,s:sig)) { result in
            
            
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                let json = try! JSON(data: data) // convert network data to json
                print("json=\(json)")
                
                print("aaa=\(json["status"])")
                if json["status"] == 20000{
                    
                    
                    self.table .reloadData()
                }
                else{
                    
                    
                }
              

                
                
            case let .failure(error):
                print("error: \(error)")
                
                let alert = AlertController(title: "Title", message: error.localizedDescription, preferredStyle: .alert)
//                alert.addAction(AlertAction(title: "Cancel", style: .normal,handler:nil))
                alert.addAction(AlertAction(title: "OK", style: .preferred))
                alert.present()
                
            }
            
            
//            switch result.isSuccess {
//            case true:
//                if let value = response.result.value {
//                    let json = JSON(value)
//                    if let number = json[0]["phones"][0]["number"].string {
//                        // 找到电话号码
//                        print("第一个联系人的第一个电话号码：",number)
//                    }
//                }
//            case false:
//                print(response.result.error)
//            }
            
            
//            // 获取标准样式
//            let view = EmptyPageView.ContentView.standard
//            // 自定义配置标准样式
//            view.configImageView(images: [UIImage(named: "empty-1002")!])
//            view.titleLabel.text = "Connection failure"
//            view.button.setTitle("TRY AGAIN", for: .normal)
//            view.button.addTarget(self, action: #selector(self.myFunc), for: UIControlEvents.touchUpInside)
//            // 将标准样式条添加至背景View上(提供了约束设置的功能)
//            let emptyView: EmptyPageView = .mix(view: view)
//            // 设置
//            self.table.setEmpty(view: emptyView) // 等价于 tableView.emptyView = emptyView
//            self.table .reloadData()
        }
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
