//
//  Time.swift
//  Project_one
//
//  Created by Jeongguk Kim on 12/31/23.
//

import Foundation

struct Time {
    private var s = 0.0
    
    var value: Double {
        get {
            return s
        }
        set(newValue) {
            s = newValue
        }
    }
    
    func sTom() -> Double {
        return s / 60
    }
    
    func sToh() -> Double {
        return s / 3600
    }
    
    func sTod() -> Double {
        return s / 86400
    }
    
    mutating func mTos(in m: Double) {
        s = m * 60
    }
    
    mutating func hTos(in h: Double) {
        s = h * 3600
    }
    
    mutating func dTos(in d: Double) {
        s = d * 86400
    }
}
