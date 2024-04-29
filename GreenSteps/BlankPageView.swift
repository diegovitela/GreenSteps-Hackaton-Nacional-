//
//  BlankPageView.swift
//  GreenSteps
//
//  Created by iOS Lab on 23/04/24.
//

import SwiftUI

struct BlankPageView: View {
    var body: some View {
        TabView {

            SecondView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            FirstView()
                .tabItem {
                    Label("Stats", systemImage: "chart.bar")
                }
            
            CalculatorView()
                .tabItem {
                    Label("Calculadora", systemImage: "pencil.and.ruler.fill")
                }
        }
        .accentColor(Color(hex: "#249414"))  // Establece el color de los ítems seleccionados
    }
}

// Extensión para Color que permite usar hexadecimales
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: UInt64
        (r, g, b) = (int >> 16, int >> 8 & 0xFF, int & 0xFF)
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: 1
        )
    }
}




