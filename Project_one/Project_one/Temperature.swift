//
//  Tmperature.swift
//  Project_one
//
//  Created by Jeongguk Kim on 12/31/23.
//

import Foundation

struct Temperature {
    private var celsius: Double = 0.0
    
    var value: Double {
        get {
            return celsius
        }
        set(newValue) {
            celsius = newValue
        }
    }
    
    func celsiusToFauci() -> Double {
        return celsius * 9/5 + 32
    }
    
    func celsiusToCalbin() -> Double {
        return celsius + 273.15
    }
    
    mutating func fauciToCelsius(in fauci: Double) {
        celsius = (fauci-32) * 5/9
    }
    
    mutating func calbinToCelsius(in calbin: Double) {
        celsius = calbin - 273.15
    }
}
