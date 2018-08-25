//
//  TipsItem.swift
//  SwifterTips
//
//  Created by kuroky on 2018/8/24.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import Foundation

class TipsItem: Codable {
    var title: String?
    var items: [TipSubItem]?
    var open: Bool?
    var isOpen: Bool {
        set {
            open = newValue
        }
        
        get {
            guard let op = self.open else {
                return false
            }
            return op
        }
    }
    
}

struct TipSubItem: Codable {
    var title: String?
}

func parserFromJsonFile() -> [TipsItem]? {
    
    guard let path = Bundle.main.path(forResource: "json", ofType: "json") else {
        return nil
    }
    
    guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
        return nil
    }
    
    let decoder = JSONDecoder()
    guard let items = try? decoder.decode([TipsItem].self, from: data) else {
        return nil
    }
    return items
}
