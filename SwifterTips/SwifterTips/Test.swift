//
//  Test.swift
//  SwifterTips
//
//  Created by kuroky on 2018/8/29.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import Foundation

class Test {
    
    func makeIncrementor(addNumber: Int) -> ((inout Int) -> ()) {
        func incrementor(variable: inout Int) -> () {
            variable += addNumber;
        }
        return incrementor;
    }
    
    func test() {
        
        var a = 3
        let incrementor = makeIncrementor(addNumber: a)
        
    }
}


