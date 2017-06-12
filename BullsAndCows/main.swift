//
//  main.swift
//  BullsAndCows
//
//  Created by Hyuntai on 2017/6/12.
//  Copyright © 2017年 hyphen. All rights reserved.
//

import Foundation
let maxTimes = 10 // 可猜次數
var len = 0       // 數字長度
let args = CommandLine.arguments // [String]
if args.count == 1 {
    print("請於終端機執行此程式")
    print("並請輸入欲猜數字的長度(例如: ./main 3)")
    exit(0)
}
if let argNum = Int(args[1]) {
    len = argNum
} else {
    print("請輸數字(例如: ./main 3)")
    exit(0)
}
let answer = createAnswer(length: len)

var guess: String?
var isWin: Bool = false
for i in 1...maxTimes {
    print("\(i)/\(maxTimes). 請猜一個數字(\(len)位數):", terminator: "")
    guess = readLine()
    // 1.[0-9]{len!}
    if guess?.characters.count != len {
        print("輸入長度為\(len)，請重新輸入")
        continue
    }
    if Int(guess!) == nil {
        print("請輸入0-9數字")
        continue
    }
    // 2.任一數字不可重複
    if isDuplicate(string: guess!) {
        print("請輸入\(len)個不同的數字")
        continue
    }
    
    
    if let gus = guess {
        let result = checkAB(answer: answer, guess: gus)
        print("檢查結果: \(result)")
        if result == "\(len)A0B" {
            isWin = true
            break
        }
    }
}
if isWin {
    print("WINNER")
} else {
    print("Loser:\(answer)")
}


