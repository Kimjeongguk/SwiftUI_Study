//
//  Volume.swift
//  Project_one
//
//  Created by Jeongguk Kim on 1/1/24.
//

import Foundation

struct Volume {
    private var ml = 0.0
    var value: Double {
        get {
            return ml
        }
        set(newValue) {
            ml = newValue
        }
    }
    
    func mlTol() -> Double {
        return ml / 1000
    }
    
    func mlToc() -> Double {
        return ml * 0.00422675
    }
    
    func mlTopt() -> Double {
        return ml * 0.00211338
    }
    
    func mlTogal() -> Double {
        return ml * 0.000264172
    }
    
    mutating func lToml(in l: Double) {
        ml = l * 1000
    }
    
    mutating func cToml(in c: Double) {
        ml = c * 100000000/422675
    }
    
    mutating func ptToml(in pt: Double) {
        ml = pt * 100000000/211338
    }
    
    mutating func galToml(in gal: Double) {
        ml = gal * 1000000000/264172
    }
    
}
