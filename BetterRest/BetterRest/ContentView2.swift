//
//  ContentView2.swift
//  BetterRest
//
//  Created by Jeongguk Kim on 1/7/24.
//

import SwiftUI
import CoreML

struct ContentView2: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var bedtime: String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Int64(Double(hour + minute)), estimatedSleep: sleepAmount, coffee: Int64(Double(coffeeAmount)))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime is..."
            return sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            alertTitle = "Error"
            return "Sorry, there was problem calculating your bedtime."
        }
        
    }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack {
            Form {
                
                //                VStack(alignment: .leading, spacing: 0) {
                //                    Text("When do you want to make up?")
                //                        .font(.headline)
                Section("When do you want to make up?"){
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                //                VStack(alignment: .leading, spacing: 0) {
                //                    Text("Desired amount of sleep")
                //                        .font(.headline)
                Section("Desired amount of sleep"){
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                //                VStack(alignment: .leading, spacing: 0) {
                //                    Text("Daily coffee intake")
                //                        .font(.headline)
                Section("Daily coffee intake") {
                    VStack {
                        Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)
                        
                        Picker("Daily coffee intake", selection: $coffeeAmount) {
                            ForEach(1...20, id: \.self) {
                                Text("\($0)")
                            }
                        }
                    }
                }
                
                Text("Your bedtime is \(bedtime)")
                    .frame(width: 300)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.green)
                    .multilineTextAlignment(.center)
                    
                
            }
//            .formStyle(FormStyleConfiguration)
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate", action: calculateBedtime)
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") {}
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func calculateBedtime() {
        alertMessage = bedtime
        showingAlert = true
    }
}

#Preview {
    ContentView2()
}
