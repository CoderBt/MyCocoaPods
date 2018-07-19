//
//  myulr.swift
//  firstSwift
//
//  Created by ctios on 2018/5/17.
//  Copyright © 2018年 ctios. All rights reserved.
//

import Foundation
import Moya

let networkActivityPlugin = NetworkActivityPlugin { change,target  -> () in
    switch(change) {
    case .ended:
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
    case .began:
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
}


private func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data // fallback to original data if it can't be serialized.
    }
}

let UgoPersonProvider = MoyaProvider<UgoPerson>(plugins: [NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter),networkActivityPlugin])

// MARK: - Provider support

private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}


/***** tagetype*****/


enum UgoPerson {
    case version(d: String, s: String)
    case login(d: String, s: String)
    
}

extension UgoPerson: TargetType {
    
    public var baseURL: URL { return URL(string: "http://211.159.169.60:8090/ugo/a")! }
    
    var path: String {
        switch self {
        
        case .version(_,_):
            return "/app/version"
        case .login(_,_):
            return "/ugoLogin"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .version(_,_),.login(_,_):
            
            return .get
        
        }
    }
    
//    var parameters: [String: Any]? {
//        switch self {
//
//        case .login(let d, let s):
//            return ["d": d,
//                    "s": s]
//        case .version(let d, let s):
//            print("salidjfasjdflasjdlfjas")
//            return ["d": d,
//                    "s": s]
//        }
//    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    public var task: Task {
        switch self {
        case .version(let d,let s):
            return .requestParameters(parameters: ["d": d,"s":s], encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    public var sampleData: Data {
        switch self {
        case .version:
            return "Half measures are as bad as nothing at all.".data(using: String.Encoding.utf8)!
        case .login(let d,_):
            return "{\"login\": \"\(d)\", \"id\": 100}".data(using: String.Encoding.utf8)!
       
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}

