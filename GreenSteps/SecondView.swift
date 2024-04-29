//
//  SecondView.swift
//  GreenSteps
//
//  Created by iOS Lab on 23/04/24.
//

import SwiftUI


struct SecondView: View {
    @State private var totalTonysCO2 = 0.0
    @State private var luz: Double = 0
    @State private var agua: Double = 0
    @State private var gas: Double = 0
    
    @State private var isPresentingInformacionView = false
    
    @State private var co2FactorLuz = 0.00052
    @State private var co2FactorAgua = 0.0003
    @State private var co2FactorGas = 0.00234

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Total:")
                            .font(.system(size: 36))
                        
                        Text("\(totalTonysCO2, specifier: "%.3f") ")
                            .font(.system(size: 36))
                            .foregroundColor(Color(hex: "#249414"))
                        
                        Text("Toneladas de CO2")
                            .font(.system(size: 15))
                            .padding(.top, 10)
                    }
                    .padding(.leading)
                    .padding(.top)
                    
                    RectangleCard(title: "Luz", number: luz, unit: "Tons de CO2", image: "foco", kWh: "", colors: [Color(hex: "#FFD600"), Color(hex: "#FCA600")])



                    RectangleCard(title: "Agua", number: agua, unit: "Tons de CO2", image: "gota", kWh: "", colors: [Color(hex: "#00C2FF"), Color(hex: "#0066FF")])

                    RectangleCard(title: "Gas", number: gas, unit: "Tons de CO2", image: "gasolina", kWh: "", colors: [Color(hex: "#12422e"), Color(hex: "#185c36")])

                    
                    HStack {
                        Spacer()
                        Button(action: {
                            isPresentingInformacionView = true
                        }) {
                            Image("mas")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                        }
                        .padding(.top, -30)
                        .padding(.bottom, 50)
                        .sheet(isPresented: $isPresentingInformacionView) {
                            InformacionView(totalTonysCO2: $totalTonysCO2, luz: $luz, agua: $agua, gas: $gas, isPresented: $isPresentingInformacionView, co2FactorLuz: co2FactorLuz, co2FactorAgua: co2FactorAgua, co2FactorGas: co2FactorGas)
                        }
                        Spacer()
                    }
                    .padding()
                }
            }
            .navigationBarTitle("Home", displayMode: .large)
            .navigationBarItems(trailing: NavigationLink(destination: ProfileView()) {
                Image(systemName: "tree.circle.fill")
                    .font(.title)
            })
            .onAppear {
                totalTonysCO2 = luz + agua + gas
            }
            .onChange(of: luz) { _ in recalculateTotal() }
            .onChange(of: agua) { _ in recalculateTotal() }
            .onChange(of: gas) { _ in recalculateTotal() }
        }
    }
    
    private func recalculateTotal() {
        totalTonysCO2 = luz + agua + gas
    }
}



struct RectangleCard: View {
    var title: String
    var number: Double
    var unit: String
    var image: String
    var kWh: String
    var colors: [Color] // Parámetro de colores
    
    var body: some View {
        Rectangle()
            .fill(LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(height: 150)
            .overlay(
                VStack {
                    HStack {
                        Image(image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding(.leading)
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text("\(number, specifier: "%.3f")")
                                .font(.title)
                                .foregroundColor(.white)
                            Text(unit)
                                .font(.caption)
                                .foregroundColor(.white)
                        }
                        .padding(.trailing)
                    }
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Text(kWh)
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding([.trailing, .bottom])
                    }
                }
            )
            .cornerRadius(20)
            .padding([.leading, .trailing, .bottom])
            .shadow(radius: 5)
    }
}







