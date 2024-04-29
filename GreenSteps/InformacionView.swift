//
//  InformacionView.swift
//  GreenSteps
//
//  Created by iOS Lab on 23/04/24.
//
import SwiftUI

struct InformacionView: View {
    @Binding var totalTonysCO2: Double // Vinculado al total en la vista principal
    @Binding var luz: Double // Vinculado al valor de luz en la vista principal
    @Binding var agua: Double // Vinculado al valor de agua en la vista principal
    @Binding var gas: Double // Vinculado al valor de gas en la vista principal
    @Binding var isPresented: Bool
    let co2FactorLuz: Double
    let co2FactorAgua: Double
    let co2FactorGas: Double
    
    let opciones = ["Luz", "Agua", "Gasolina"]
    @State private var opcionSeleccionada = 0
    @State private var fechaSeleccionada = Date()
    @State private var cantidadTexto = ""
    @State private var showingConfirmation = false
    
    let customGreen = Color(red: 100/255, green: 161/255, blue: 104/255) // Definir el color personalizado
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Spacer()
                Text("Información")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.top, 40)
            
            Picker(selection: $opcionSeleccionada, label: Text("Seleccione")) {
                ForEach(0..<opciones.count) { index in
                    Text(self.opciones[index])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            
            DatePicker("", selection: $fechaSeleccionada, displayedComponents: .date)
                .labelsHidden()
                .accentColor(.blue)
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            
            TextField("Agregar \(opcionSeleccionada == 0 ? "Kwh" : "L")", text: $cantidadTexto)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 3)
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                .keyboardType(.numberPad)
            
            Button(action: {
                var co2 = 0.0
                
                switch self.opcionSeleccionada {
                case 0: // Luz
                    co2 = (Double(self.cantidadTexto) ?? 0) * self.co2FactorLuz
                    self.luz += co2
                case 1: // Agua
                    let litros = Double(self.cantidadTexto) ?? 0
                    co2 = litros * self.co2FactorAgua
                    self.agua += co2
                case 2: // Gasolina
                    let litros = Double(self.cantidadTexto) ?? 0
                    co2 = litros * self.co2FactorGas
                    self.gas += co2
                default:
                    break
                }

                // Actualizar el total de toneladas de CO2
                self.totalTonysCO2 += co2
                self.cantidadTexto = ""
                self.isPresented = false
            }) {
                Text("Enviar")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(customGreen)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            }
            .padding(.bottom, 40)
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .navigationBarTitle("", displayMode: .inline)
        .edgesIgnoringSafeArea(.bottom)
    }
}










