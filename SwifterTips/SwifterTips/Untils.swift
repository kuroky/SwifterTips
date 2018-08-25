//
//  Untils.swift
//  SwifterTips
//
//  Created by kuroky on 2018/8/24.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import Foundation

/// 从bundle文件取string
func json(fileName: String) -> String? {
    
    guard let bundlePath = Bundle.main.path(forResource: "Resource", ofType: "bundle") else {
        return nil
    }
    
    guard let bundle = Bundle(path: bundlePath) else {
        return nil
    }
    
    guard let path = bundle.path(forResource: fileName, ofType: "md") else {
        return nil
    }
    
    guard let mdStr = try? String(contentsOfFile: path) else {
        return nil
    }
    
    return mdStr
}
