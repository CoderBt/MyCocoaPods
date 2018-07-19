//
//  ViewController.swift
//  firstSwift
//
//  Created by ctios on 2018/4/26.
//  Copyright © 2018年 ctios. All rights reserved.
//

import UIKit

enum Rank: Int {
    case ace
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

class NamedShape {
    var numberOfSides = 0
    var name:String
    
    var englishName:String{

        set{
            
            self.englishName = "zlx"
        }
        get{
            
            return (String)(numberOfSides + 2)
        }

    }
//
    init(myname:String){
        self.name = myname;
    }
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var dic = ["key1":"value1","key2":"value2"]
        
        var dic1 = [Int:String]()
        dic1[1] = "value1";
        dic1[1] = "value2";
        dic1[1] = nil;
        print(dic1);
        
        
        let `class` = "123"
        
        let a = 1+2
        print(a)
    
        
        for x in 0...10{
            print("\(x) ", terminator: "")
        }
        print()
        
        let theInput = readLine()
        print("String(describing: theInput)aaaaabbb")
        
        
        let optionalString: String? = "Hello"
        print(optionalString == nil)
        
        
        var optionalName: String? = " "
        var greeting = "Hello!"
        if let name = optionalName {
            greeting = "Hello, \(name)"
        }
        print("ABC"+greeting)
        
        //switch
        let vegetable = "red pepper"
        switch vegetable {
        case "celery":
            print("Add some raisins and make ants on a log.")
        case "cucumber", "watercress":
            print("That would make a good tea sandwich.")
        case let x where x.hasSuffix("pepper"):
            print("Is it a spicy \(x)?")
        default:
            print("Everything tastes good in soup.")
        }
        
        var num = 0
//        while num < 5 {
//            print("end")
//            num = num + 1
//        }
//
//        print(num)
        
        repeat{
            
            num = num + 2
        }
            while num < 6
        
        print(num)
        
        
        var total = 0
        for i in 0..<4 {
            total += i
        }
        print(total)
        
        
        let statistics = calculateStatistics(scores:[5, 3, 100, 3, 9])
        print(statistics.sum)
        print(statistics.0)
        
        
        
        let shape = NamedShape.init(myname:"zlx")
        shape.numberOfSides = 7
        let shapeDescription = shape.simpleDescription()
        print(shapeDescription)
        
        print("shape.englishName=\(shape.englishName)")
        
        
        struct Number
        {
            var digits: Int
            var numbers = 3.1415
        }
        
        var n = Number(digits: 12345,numbers: 3.2)
        n.digits = 67
        
        print("\(n.digits)")
        print("\(n.numbers)")
        n.numbers = 8.7
        
        
        let ace = Rank.ace
        let abc = Rank.jack
        
        print("ace=\(ace)")
        print("aceRawValue=\(abc)")
        
        
        
        vari(members: 4,3,5)
//
//        vari1(members: [1,2,3])
        
        let arr123:NSMutableArray = NSMutableArray.init()

        arr123.add("abc")

        print(arr123)
        
        var array1 : [String] = [String]()
        array1.append("1")
               print(array1)
        
        let arrary2:NSMutableArray = NSMutableArray.init()
        arrary2.add("2")
        print(arrary2)
        
        
        var array30:[Any] = [2, 3, "4"]
        let array40 :[Any] = [1, 23]
                let array50 = array30 + array40
                print(array50)
        
        
        vari1(members: &array30)
        
        
        var emptyArray:[String]
        emptyArray = [String]()
        emptyArray.append("123");
        
        print(emptyArray)
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
        var min = scores[0]
        var max = scores[0]
        var sum = 0
        
        for score in scores {
            if score > max {
                max = score
            } else if score < min {
                min = score
            }
            sum += score
        }
        
        return (min, max, sum)
    }
  
    func vari<N>(members: N...){
       
        for i in members {
            print(i)
        }
    }
    
    
    func vari1<N>(members: inout [N]){
        for i in members {
            print(i)
        }
    }
}



