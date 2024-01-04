//
//  Length.swift
//  Project_one
//
//  Created by Jeongguk Kim on 12/31/23.
//

import Foundation

struct Length {
    private var m = 0.0
    var value: Double {
        get {
            return m
        }
        set(newValue) {
            m = newValue
        }
    }
    
    func mToKm() -> Double {
        return m * 1/1000
    }
    
    func mToft() -> Double {
        return m * 3.28
    }
    
    func mToyd() -> Double {
        return m * 1.0936
    }
    
    func mTomi() -> Double {
        return m * 0.000621371
    }
    
    mutating func kmTom(in km: Double) {
        m = km * 1000
    }
    
    mutating func ftTom(in ft: Double) {
        m = ft * 100/328
    }
    
    mutating func ydTom(in yd: Double) {
        m = yd * 10000/10936
    }
    
    mutating func miTom(in mi: Double) {
        m = mi * 1000000000/621371
    }
    
    
}
