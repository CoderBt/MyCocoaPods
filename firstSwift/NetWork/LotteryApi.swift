//
//  LotteryApi.swift
//  firstSwift
//
//  Created by ctios on 2018/5/28.
//  Copyright © 2018年 ctios. All rights reserved.
//

import Foundation
import Moya

let Lo_networkActivityPlugin = NetworkActivityPlugin { change,target  -> () in
    switch(change) {
    case .ended:
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
    case .began:
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
}


//private func JSONResponseDataFormatter(_ data: Data) -> Data {
//    do {
//        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
//        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
//        return prettyData
//    } catch {
//        return data // fallback to original data if it can't be serialized.
//    }
//}

let LotterynProvider = MoyaProvider<Lottery>(plugins: [NetworkLoggerPlugin(verbose: true),Lo_networkActivityPlugin])

// MARK: - Provider support

private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}


/***** tagetype*****/

enum Lottery {
    case types
    
}

extension Lottery: TargetType {
    
    public var baseURL: URL { return URL(string: "http://apis.juhe.cn/lottery")! }
    
    var path: String {
        switch self {
            
        case .types:
            return "/types"
        
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .types:
            return .get
            
        }
     }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    public var task: Task {
        switch self {
        case .types:
             return .requestParameters(parameters: ["key": "b2d8baed7c3e467dbce579810402be0e"], encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    public var sampleData: Data {
        switch self {
        case .types:
            return "Half measures are as bad as nothing at all.".data(using: String.Encoding.utf8)!
       
            
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}

