//
//  swapArray.swift
//  hyuntai04
//
//  Created by Hyuntai on 2017/6/9.
//  Copyright © 2017年 hyphen. All rights reserved.
//

import Foundation
func swapArray(_ array:inout Array<Int>, _ someIndex: UInt16, _ anotherIndex: UInt16) {
    // 相同時不做
    if someIndex == anotherIndex {
        return
    }
    // 超過陣列範圍不做
    if Int(someIndex) >= array.count || Int(anotherIndex) >= array.count {
        return
    }
    swap(&array[Int(someIndex)], &array[Int(anotherIndex)])
}
