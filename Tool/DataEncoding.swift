//
//  DataEncoding.swift
//  firstSwift
//
//  Created by ctios on 2018/5/18.
//  Copyright © 2018年 ctios. All rights reserved.
//
import CryptoSwift


class DataEncoding: NSObject {
    
  open  static  func Endcode_AES_ECB(strToEncode:String) ->String {
        
        
        let key = "CTTC-UGO00000000"
        let aes = try! AES(key: key.bytes,blockMode: .ECB, padding: .pkcs7)
        
        
        do {
           let encrypted = try aes.encrypt(strToEncode.bytes)
           return encrypted.toBase64()!
            
        } catch {
            print("123123=\(error)")
        }
        
        return ""
        
        
    }
    
    
}
