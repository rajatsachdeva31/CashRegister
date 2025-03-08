//
//  CustomNumberPad.swift
//  CashRegister
//
//  Created by Rajat Sachdeva on 2025-03-04.
//

import SwiftUI

struct CustomNumberPad: View {
    @Binding var enteredValue: String

    let numberButtons = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        ["C", "0", "⌫"]
    ]

    var body: some View {
        VStack {
            ForEach(numberButtons, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { button in
                        Button(action: {
                            handleButtonPress(button)
                        }) {
                            Text(button)
                                .font(.largeTitle)
                                .frame(width: 80, height: 80)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
    }

    private func handleButtonPress(_ value: String) {
        switch value {
        case "C":
            enteredValue = ""
        case "⌫":
            if !enteredValue.isEmpty {
                enteredValue.removeLast()
            }
        default:
            if enteredValue.count < 3 { // Limiting input size
                enteredValue += value
            }
        }
    }
}
