//
//  TypesController.swift
//  firstSwift
//
//  Created by ctios on 2018/5/28.
//  Copyright © 2018年 ctios. All rights reserved.
//


import UIKit
import Toast_Swift
import Instructions


class TypesController: MyBaseController_OC, UITableViewDataSource, UITableViewDelegate,CoachMarksControllerDataSource, CoachMarksControllerDelegate {
    
    
    var demoButton: UIButton!
    
    let pointOfInterest = UIView()
    
    
    func coachMarksController(_ coachMarksController: CoachMarksController,
                              didEndShowingBySkipping skipped: Bool) {
        print("didEndShowingBySkipping: \(skipped)")
        
        UserDefaults.standard.set(false, forKey: "ShowInstruction")
    }
    
    func coachMarksController(_ coachMarksController: CoachMarksController, coachMarkViewsAt index: Int, madeFrom coachMark: CoachMark) -> (bodyView: CoachMarkBodyView, arrowView: CoachMarkArrowView?) {
        let coachViews = coachMarksController.helper.makeDefaultCoachViews(withArrow: true, arrowOrientation: coachMark.arrowOrientation)
        
        coachViews.bodyView.hintLabel.text = "Hello! I'm a Coach Mark!"
        coachViews.bodyView.nextLabel.text = "Ok!"
        
        return (bodyView: coachViews.bodyView, arrowView: coachViews.arrowView)
    }
    
    func coachMarksController(_ coachMarksController: CoachMarksController, coachMarkAt index: Int) -> CoachMark {
//        return coachMarksController.helper.makeCoachMark(for: pointOfInterest)
        
        switch(index) {
        case 0:
            return coachMarksController.helper.makeCoachMark(for: self.navigationController?.navigationBar) 
        case 1:
            return coachMarksController.helper.makeCoachMark(for: self.demoButton)
        case 2:
            return coachMarksController.helper.makeCoachMark(for: self.demoButton)
        case 3:
            return coachMarksController.helper.makeCoachMark(for: self.demoButton)
        case 4:
            return coachMarksController.helper.makeCoachMark(for: self.demoButton)
        default:
            return coachMarksController.helper.makeCoachMark()
        }
        
//        var coachMark : CoachMark
//        coachMark = coachMarksController.helper.makeCoachMark(for: self.demoButton)
//        coachMark.arrowOrientation = .top
//        return coachMark
    }
    
    func numberOfCoachMarks(for coachMarksController: CoachMarksController) -> Int {
        return 2
    }
    
    
    let coachMarksController = CoachMarksController()
    
    var table:UITableView!
    var myArry:[String] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (table.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)) as UITableViewCell
//        cell.textLabel?.text = myArry[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if  UserDefaults.standard.bool(forKey: "ShowInstruction"){
            
            self.coachMarksController.start(on: self)
            
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.coachMarksController.stop(immediately: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.coachMarksController.delegate = self
        self.coachMarksController.dataSource = self
        self.coachMarksController.overlay.color = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.5)
        self.coachMarksController.overlay.allowTap = true
        
        let skipView = CoachMarkSkipDefaultView()
        skipView.setTitle("Skip", for: .normal)
        skipView.setTitleColor(UIColor.white, for: .normal)
        skipView.setBackgroundImage(nil, for: .normal)
        skipView.setBackgroundImage(nil, for: .highlighted)
        skipView.layer.cornerRadius = 0
        skipView.backgroundColor = UIColor.darkGray
        
        self.coachMarksController.skipView = skipView
        
        
        self.navigationItem.title = "Lottery"
        
        
        
        //设置UITableView的位置
        let rect = self.view.frame
        self.table = UITableView(frame: rect)
        
        self.table.dk_backgroundColorPicker =  DKColorTable.shared().picker(withKey: "BG")
        
        //设置数据源
        self.table.dataSource = self
        //设置代理
        self.table.delegate = self
        
        //注册UITableView，cellID为重复使用cell的Identifier
        self.table.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        self.view.addSubview(table)
        
        self.table.isUserInteractionEnabled = true
        self.table.tableFooterView = UIView(frame: CGRect.zero)
        
//
//        self.table.setEmpty(view: EmptyStates.loading)
        
        self.table.gtm_addRefreshHeaderView {
            [weak self] in
            print("excute refreshBlock")
            self?.request()
        }
        
//        self.table.gtm_addLoadMoreFooterView {
//            [weak self] in
//            print("excute loadMoreBlock")
//            //self.loadMore()
//        }
        
//        self.request()
        
        
        //获取Appdelegate
//        let myAppdelegate = UIApplication.shared.delegate as! AppDelegate
//        myAppdelegate.zTabBarController?.view.makeToastActivity(.center)
        
        
        demoButton = UIButton.init()
        self.view.addSubview(demoButton)
        demoButton.backgroundColor = UIColor.red
        demoButton.setTitleColor(UIColor.white, for: .normal)
        demoButton.setTitle("skip", for: .normal)
        demoButton.titleLabel?.font = UIFont.init(name: "Nunito-Bold", size: 20)
       
        demoButton.snp.makeConstraints { (make) in
//            make.width.height.equalTo(80)
//            make.center.equalTo(self.view)
            make.top.equalTo(10)
            make.left.equalTo(self.view).offset(10)
            
            make.right.equalTo(self.view).offset(-300)
        }
        
//        demoButton.snp.makeConstraints { (make) -> Void in
//            make.width.height.equalTo(80)
//            make.center.equalTo(self.view)
//        }
        
        
        let headView:UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        headView.image = UIImage.init(named: "Key")
        headView.center = CGPoint.init(x: kscreenWidth/2, y: 100)
//        headView.backgroundColor = UIColor.red
        self.view.addSubview(headView)
        headView.snp.makeConstraints { (make) in
            make.left.equalTo(demoButton.snp.right).offset(10)
            make.top.equalTo(demoButton.snp.bottom).offset(20)
            make.width.height.equalTo(100)
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func myFunc(_ button:UIButton) {
        
        print("button click=\(button.tag)")
        
        
        self.request()
    }
    
    func request(){
        
        LotterynProvider.request(.types) { result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                let json = try! JSON(data: data) // convert network data to json
                print("json=\(json)")
                
                print("aaa=\(json["status"])")
                if json["error_code"] == 0{
                    
                    self.myArry.append(json["result"][0]["lottery_name"].string!)
                    self.table .reloadData()
                }
                else{
                    
                    
                }
                
                
                
                
            case let .failure(error):
                print("error: \(error)")
                
//                let alert = AlertController(title: "Title", message: error.localizedDescription, preferredStyle: .alert)
//                //                alert.addAction(AlertAction(title: "Cancel", style: .normal,handler:nil))
//                alert.addAction(AlertAction(title: "OK", style: .preferred))
//                alert.present()
                
//                // 获取标准样式
//                let view = EmptyPageView.ContentView.standard
//                // 自定义配置标准样式
//                view.configImageView(images: [UIImage(named: "error")!])
//                view.titleLabel.text = error.errorDescription
//                view.textLabel.text = ""
//                view.button.setTitle("重新加载", for: .normal)
//                view.button.titleLabel?.font = UIFont.init(name: "AppleSDGothicNeo", size: 20)
////                view.button.setTitleColor(UIColor.white, for: .normal)
////                view.button.setTitleColor(ColorDeepBlue, for: .highlighted)
//                view.button.setBackgroundImage(UIImage.init(color: ColorBlue, size: CGSize.init(width: 90, height: 22)), for: .normal)
//                view.button.setBackgroundImage(UIImage.init(color: ColorDeepBlue, size: CGSize.init(width: 90, height: 22)), for: .highlighted)
//                view.button.layer.masksToBounds = true;
//                view.button.layer.cornerRadius = 5
//                view.button.addTarget(self, action: #selector(self.myFunc), for: UIControlEvents.touchUpInside)
//                // 将标准样式条添加至背景View上(提供了约束设置的功能)
//                let emptyView: EmptyPageView = .mix(view: view)
//                // 设置
//                self.table.setEmpty(view: emptyView) // 等价于 tableView.emptyView = emptyView
//                self.table .reloadData()
                
            }
            
            
            
           
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
