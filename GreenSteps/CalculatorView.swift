//
//  CalculatorView.swift
//  GreenSteps
//
//  Created by iOS Lab on 24/04/24.
//

import SwiftUI

struct CalculatorView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Spacer()
                    
                    NavigationLink(destination: LuzView()) {
                        ButtonView(color: LinearGradient(gradient: Gradient(colors: [.yellow, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing), text: "Luz", icon: "lightbulb")
                    }
                    
                    NavigationLink(destination: AguaView()) {
                        ButtonView(color: LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing), text: "Agua", icon: "drop.fill")
                    }
                    
                    NavigationLink(destination: GasView()) {
                        ButtonView(color: LinearGradient(gradient: Gradient(colors: [.green, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing), text: "Gasolina", icon: "fuelpump.fill")
                    }
                    
                    Spacer()
                    Spacer()
                    Spacer()
                }
                .navigationBarTitle("Calculadora", displayMode: .large)
                .navigationBarTitleDisplayMode(.inline)
                .padding()
            }
        }
    }
}

struct ButtonView: View {
    var color: LinearGradient
    var text: String
    var icon: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(color)
                .frame(height: 100) // Aumentado de 50 a 100
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.white)
                Text(text)
                    .foregroundColor(.white)
                    .bold()
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
        }
    }
}
