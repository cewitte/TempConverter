//
//  ContentView.swift
//  TempConverter
//
//  Created by Carlos Eduardo Witte on 04/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var tempEntry: Double = 0.0
    @State private var tempEntryScale = "Celsius"
    
    let scales = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var celsius : Double {
        switch tempEntryScale {
        case "Fahrenheit":
            return (tempEntry - 32) / 1.8
        case "Kelvin":
            return tempEntry - 273.15
        default:
            return tempEntry
        }
    }
    
    var fahrenheit: Double {
        switch tempEntryScale {
        case "Celsius":
            return (tempEntry * 1.8) + 32
        case "Kelvin":
            return (tempEntry - 273.15) * 9 / 5 + 32
        default:
            return tempEntry
        }
    }
    
    var kelvin: Double {
        switch tempEntryScale {
        case "Celsius":
            return tempEntry + 273.15
        case "Fahrenheit":
            return (tempEntry - 32) * 5 / 9 + 273.15
        default:
            return tempEntry
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Add the temperature") {
                    TextField("Temperature", value: $tempEntry, format: .number)
                        .keyboardType(.decimalPad)
            
                    Picker("Temperature Scale", selection: $tempEntryScale) {
                        ForEach(scales, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Converted Temperature") {
                    Text("\(celsius.formatted())º F")
                    Text("\(fahrenheit.formatted())º F")
                    Text("\(kelvin.formatted())º K")
                }
            }
            .navigationTitle("Temperature Converter")
        }
    }
}

#Preview {
    ContentView()
}
