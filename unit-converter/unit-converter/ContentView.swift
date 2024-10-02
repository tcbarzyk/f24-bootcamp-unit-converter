//
//  ContentView.swift
//  unit-converter
//
//  Created by Teddy Barzyk on 10/1/24.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = 0.0
    @State private var inputUnit = ""
    @State private var outputUnit = ""
    
    let units = ["mL", "Liters", "Cups", "Pints", "Gallons"]
    
    let literToMilliliter = 1000.0
    let cupToMilliliter = 236.588
    let pintToMilliliter = 473.176
    let gallonToMilliliter = 3785.41
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section ("Input Value and Unit") {
                        TextField("Input Value", value: $inputValue, format: .number)
                        Picker("Unit", selection: $inputUnit) {
                            ForEach(units, id: \.self) { unit in
                                Text(unit)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    Section("Convert to") {
                        Picker("Unit", selection: $outputUnit) {
                            ForEach(units, id: \.self) { unit in
                                Text(unit)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    Section("Output") {
                        Text("\(fromML(unit: outputUnit, value: toML(unit: inputUnit, value: inputValue)), specifier: "%.2f")")
                    }
                }
                .navigationTitle("Volume Converter")
            }
        }
    }
    
    func toML (unit: String, value: Double) -> Double {
        switch unit {
        case "mL":
            return value
        case "Liters":
            return value * literToMilliliter
        case "Cups":
            return value * cupToMilliliter
        case "Pints":
            return value * pintToMilliliter
        case "Gallons":
            return value * gallonToMilliliter
        default:
            return 0
        }
    }
    
    func fromML (unit: String, value: Double) -> Double {
        switch unit {
        case "mL":
            return value
        case "Liters":
            return value / literToMilliliter
        case "Cups":
            return value / cupToMilliliter
        case "Pints":
            return value / pintToMilliliter
        case "Gallons":
            return value / gallonToMilliliter
        default:
            return 0
        }
    }
}

#Preview {
    ContentView()
}
