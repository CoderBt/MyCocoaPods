//
//  TempClass.swift
//  firstSwift
//
//  Created by ctios on 2018/6/13.
//  Copyright © 2018年 ctios. All rights reserved.
//

import Foundation

 private class TempClass {
    
    var name:String = "zlx"
    let age : Float = 0.0
    
    var _tt:String?
    var tt: String?{
        
        set{
            
            _tt=newValue
        }
        get{
            return "11123\(age)"
        }
    }
    
     func getName(){
        
        FSLog(message: "\(name)")
    }
    
}

private class aClass: TempClass {
    
    var c:Int = 1
    
    
    private var _tittle:String?
    var tittle: String?{
        
        set{
            
            _tittle=newValue
        }
        get{
            return name
        }
    }
    
    var ddd:Int {
        get{
            return c+11
        }
        
        set{
            c = c + newValue
        }
    }
    
    
    let aaa = "aaa"
    lazy var ccc:[aClass] = {
        
        var arr = [aClass]()
        for _ in 0...99{
            let testModel = aClass()
            arr.append(testModel)
        }
        //
        return arr
    }()
    
    
    var newAge:String?{
        
        willSet{
            //
            print("===========")
        }
        
        didSet{
            print("did set " + newAge!)
        }
    }
    
    override func getName() {
        
        FSLog(message: "getnameaaa")
        
    }
    
    
}
