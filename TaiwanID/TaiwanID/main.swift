//
//  main.swift
//  TaiwanID
//
//  Created by Hyuntai on 2017/6/15.
//  Copyright © 2017年 hyphen. All rights reserved.
//

import Foundation

func substr(string: String, start: Int, length: Int) -> String {
    var catchLength = length
    if length <= 0 {
        return ""
    }
    if start > string.characters.count-1 {
        return ""
    }
    if start + length > string.characters.count-1 {
        catchLength = string.characters.count-start
    }
    let sIndex = string.index(string.startIndex, offsetBy: start)
    let eIndex = string.index(string.startIndex, offsetBy: start + catchLength)
    let range = sIndex..<eIndex
    return string[range]
}

struct TaiwanID {
    var id: String
    init() {
        // region為亂數
        let region = Int(arc4random_uniform(26)) + 10
        self.init(region: region)
    }
    init(gender: Bool) {
        // region為亂數
        let region = Int(arc4random_uniform(26)) + 10
        self.init(gender: gender, region: region)
    }
    init(region: Int) {
        // gender為亂數
        let gender = Bool(arc4random_uniform(2) as NSNumber)
        self.init(gender: gender, region: region)
    }
    init(gender: Bool, region: Int) {
        if region < 10  || region > 35 {
            id = ""
        }
        let regionCodes = "ABCDEFGHJKLMNPQRSTUVXYZWIO"
        let n1  = region / 10
        let n2  = region % 10
        let n3  = Int(NSNumber(value: gender)) + 1
        let n4  = Int(arc4random_uniform(10))
        let n5  = Int(arc4random_uniform(10))
        let n6  = Int(arc4random_uniform(10))
        let n7  = Int(arc4random_uniform(10))
        let n8  = Int(arc4random_uniform(10))
        let n9  = Int(arc4random_uniform(10))
        let n10 = Int(arc4random_uniform(10))
        let n11 = 10 - (n1 * 1 + n2 * 9 + n3 * 8 + n4 * 7 + n5 * 6 +
                  n6 * 5 + n7 * 4 + n8 * 3 + n9 * 2 + n10) % 10
        id = substr(string: regionCodes, start: region - 10, length: 1) +
             String(n3) + String(n4) + String(n5)  + String(n6) + String(n7) +
             String(n8) + String(n9) + String(n10) + String(n11)
    }
}
let myID = TaiwanID()
//let myID = TaiwanID(gender: false)
//let myID = TaiwanID(region: 22)
//let myID = TaiwanID(gender: false, region: 11)
print(myID.id)



