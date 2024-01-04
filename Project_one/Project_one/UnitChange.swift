//
//  UnitChange.swift
//  Project_one
//
//  Created by Jeongguk Kim on 12/31/23.
//

import SwiftUI

struct UnitChange: View {
    @State private var amount = 0.0
    @State private var unitSection = "Temperature"
    @State private var secondUnit = "(°C)"
    @State private var thirdUnit = "(°C)"
    
    let units = ["Temperature", "Length", "Time", "Volume"]
    let tmperatures = ["(°C)", "(°F)", "(K)"]
    let lengths = ["(m)", "(Km)", "(ft)", "(yd)", "(mi)"]
    let times = ["(s)", "(m)", "(h)", "(d)"]
    let volumes = ["(mL)", "(L)", "(c)", "(pt)", "(gal)"]
    
    var selectedUnit: [String] {
        switch unitSection {
        case "Temperature": return tmperatures
        case "Length": return lengths
        case "Time": return times
        case "Volume": return volumes
        default: return []
        }
    }
    
    var inputUnit: [String] {
        return selectedUnit
    }
    
    var outputUnit: [String] {
        return selectedUnit
    }
    
    
    var tmperatureChanged: Double {
        var t = Temperature()
        switch secondUnit {
        case "(°C)": t.value = amount
        case "(°F)": t.fauciToCelsius(in: amount)
        case "(K)" : t.calbinToCelsius(in: amount)
        default: return 0.0
        }
        
        switch thirdUnit {
        case "(°C)": return t.value
        case "(°F)": return t.celsiusToFauci()
        case "(K)" : return t.celsiusToCalbin()
        default: return 0.0
        }
    }
    
    var lengthChanged: Double {
        var l = Length()
        switch secondUnit {
        case "(m)": l.value = amount
        case "(Km)": l.kmTom(in: amount)
        case "(ft)": l.ftTom(in: amount)
        case "(yd)": l.ydTom(in: amount)
        case "(mi)": l.miTom(in: amount)
        default : return 0.0
        }
        
        switch thirdUnit {
        case "(m)": return l.value
        case "(Km)": return l.mToKm()
        case "(ft)": return l.mToft()
        case "(yd)": return l.mToyd()
        case "(mi)": return l.mTomi()
        default : return 0.0
        }
    }
    
    var timeChanged: Double {
        var t = Time()
        switch secondUnit {
        case "(s)": t.value = amount
        case "(m)": t.mTos(in: amount)
        case "(h)": t.hTos(in: amount)
        case "(d)": t.dTos(in: amount)
        default : return 0.0
        }
        
        switch thirdUnit {
        case "(s)": return t.value
        case "(m)": return t.sTom()
        case "(h)": return t.sToh()
        case "(d)": return t.sTod()
        default : return 0.0
        }
    }
    
    var volumeChanged: Double {
        var v = Volume()
        switch secondUnit {
        case "(mL)": v.value = amount
        case "(L)": v.lToml(in: amount)
        case "(c)": v.cToml(in: amount)
        case "(pt)": v.ptToml(in: amount)
        case "(gal)": v.galToml(in: amount)
        default: return 0.0
        }
        
        switch thirdUnit {
        case "(mL)": return v.value
        case "(L)": return v.mlTol()
        case "(c)": return v.mlToc()
        case "(pt)": return v.mlTopt()
        case "(gal)": return v.mlTogal()
        default: return 0.0
        }
    }
    
    var outputValue: Double {
        switch unitSection {
        case "Temperature": return tmperatureChanged
        case "Length": return lengthChanged
        case "Time": return timeChanged
        case "Volume": return volumeChanged
        default: return 0.0
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("단위 선택") {
                    Picker("Units", selection: $unitSection) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .onChange(of: unitSection) {
                        updateSecondUnit()
                        updatethirdUnit()
                    }
                }
                Section("입력 단위"){
                    Picker("Second Unit", selection: $secondUnit) {
                        ForEach(inputUnit, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    TextField("Amount", value: $amount, format: .number)
                        .keyboardType(.decimalPad)
                }
                Section("출력 단위"){
                    Picker("Second Unit", selection: $thirdUnit) {
                        ForEach(outputUnit, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    Text("\(outputValue)")
                }
            }
            .navigationTitle("Unit Change")
        }
    }
    
    func updateSecondUnit() {
            secondUnit = selectedUnit[0]
        }
    func updatethirdUnit() {
            thirdUnit = selectedUnit[0]
        }

}

#Preview {
    UnitChange()
}
