//
//  main.swift
//  BitWiseXOR
//
//  Created by Preeteesh Remalli on 21/09/22.
//

import Foundation

public func solution(_ M : Int, _ N : Int) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    var r = M
    for i in 5..<8{
        r = findBitXOR(M: r, N: i + 1)
    }
    return r
}

func findBitXOR(M: Int, N: Int) -> Int{
    func pad(string : String, toSize: Int) -> String {
        var padded = string
        for _ in 0..<(toSize - string.count) {
            padded = "0" + padded
        }
        return padded
    }
    
    let bb1 = String(M, radix: 2)
    let bb2 = String(N, radix: 2)
    var result = ""
    var diff = 0
    var b1 = Array(String(M, radix: 2))
    var b2 = Array(String(N, radix: 2))
    if (bb1.count != bb2.count){
        if bb1.count > bb2.count {
            diff = bb1.count - bb2.count
            let bbb2 = pad(string: bb2, toSize: bb2.count+diff)
            b2 = Array(bbb2)
            
        }else{
            diff = bb2.count - bb1.count
            let bbb1 = pad(string: bb1, toSize: bb1.count+diff)
            b1 = Array(bbb1)
        }
    }
    
    for (v1, v2) in zip(b1, b2) {
        
        if v1 == v2{
            result.append("0")
        }else{
            result.append("1")
        }
    }
    return(Int(result, radix: 2)!)
}

print(solution(5, 8))


