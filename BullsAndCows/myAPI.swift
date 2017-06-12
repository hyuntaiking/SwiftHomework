//
//  myAPI.swift
//  BullsAndCows
//
//  Created by Hyuntai on 2017/6/12.
//  Copyright © 2017年 hyphen. All rights reserved.
//

import Foundation
// 產生謎底
func createAnswer(length: Int) -> String {
    var result = ""
    var digits = Set<Int>()
    while digits.count < length {
        digits.insert(Int(arc4random_uniform(10)))
    }
    for digit in digits {
        result.append(String(digit))
    }
    return result
}
func checkAB(answer: String, guess: String) -> String {
    var a = 0, b = 0
    var ca: String, cg: String
    if answer.characters.count != guess.characters.count {
        return "0A0B"
    }
    for i in 0..<answer.characters.count {
        ca = substr(string: answer, start: i, length: 1)
        cg = substr(string: guess, start: i, length: 1)
        if ca == cg {
            a += 1
        } else if answer.contains(cg) {
            b += 1
        }
    }
    return "\(a)A\(b)B"
}
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
func isDuplicate(string: String) -> Bool {
    var numSet = Set<String>()
    for i in 0..<string.characters.count {
        numSet.insert(substr(string: string, start: i, length: 1))
    }
    if numSet.count != string.characters.count {
        return true
    } else {
        return false
    }
}
