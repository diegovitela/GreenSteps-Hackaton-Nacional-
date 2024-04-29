//
//  GasView.swift
//  GreenSteps
//
//  Created by iOS Lab on 24/04/24.
//

import SwiftUI

struct GasView: View {
    @State private var distanciaRecorrida = 0
    @State private var kilometrajeAuto = 0
    @State private var promedioMPG = 0
    @State private var usaAutoElectrico = false
    @State private var tipoCombustible = ""
    @State private var showFinishView = false

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(spacing: 20) {
                        Text("Calcula tu huella de carbono por consumo de gasolina")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding()
                        
                        questionView(question: "¿Cuántos kilómetros recorres en un mes?", value: $distanciaRecorrida)
                        questionView(question: "¿Cuántos kilómetros ha recorrido tu auto en total?", value: $kilometrajeAuto)
                        questionView(question: "¿Cuál es el promedio de millas por galón (MPG) de tu auto?", value: $promedioMPG)
                        toggleView(question: "¿Usas un auto eléctrico como tu principal medio de transporte?", isOn: $usaAutoElectrico)
                        
                    }
                    .padding()
                }
               
                
                NavigationLink(destination: FinishView(carbonFootprintData: calculateCarbonFootprint(), isPresented: $showFinishView), isActive: $showFinishView) {
                    EmptyView()
                }
                
                Button("Enviar") {
                    showFinishView = true // Activar la navegación hacia FinishView
                }
                .bold()
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding()
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    // Función para calcular la huella de carbono por consumo de gasolina
    func calculateCarbonFootprint() -> CarbonFootprintData {
        // Implementa aquí la lógica para calcular la huella de carbono basada en las respuestas del usuario
        // Por ahora, solo devolveremos un valor aleatorio para demostrar
        let randomValue = Double.random(in: 0.0...100.0)
        return CarbonFootprintData(carbonFootprint: randomValue)
    }
}

struct CarbonFootprintData3 {
    var carbonFootprint: Double
    // Puedes agregar más propiedades según sea necesario para representar los datos de la huella de carbono
}

struct FinishView3: View {
    var carbonFootprintData: CarbonFootprintData
    @Binding var isPresented: Bool // Binding para controlar la visibilidad de la vista LuzView
    
    var body: some View {
        VStack {
            Spacer() // Agrega espacio para empujar la carta hacia abajo
            Text("¡Gracias por calcular tu huella de carbono por consumo de gasolina!")
                .font(.title)
                .padding()
            
            Text("Tu huella de carbono es de \(carbonFootprintData.carbonFootprint) kg de CO2.")
                .padding()
            
            // Botón de regreso
            Button(action: {
                withAnimation {
                    isPresented = false // Cierra la vista FinishView
                }
            }) {
                Image(systemName: "")
                    .foregroundColor(.orange) // Cambia el color de la flecha a naranja para representar la gasolina
            }
            .padding()
        }
        .offset(y: isPresented ? 0 : UIScreen.main.bounds.height) // Desplaza la vista hacia abajo cuando isPresented es falso
        .navigationBarBackButtonHidden(true) // Oculta el botón de retroceso predeterminado
        .navigationBarItems(leading: EmptyView()) // Asegura que no haya ningún elemento de navegación en la barra
    }
}

// Funciones helper

func questionView3(question: String, value: Binding<Int>) -> some View {
    VStack {
        Text(question)
            .bold()
        HStack {
            Button(action: {
                if value.wrappedValue > 0 {
                    value.wrappedValue -= 1
                }
            }) {
                Image(systemName: "minus.circle.fill")
                    .font(.title2)
            }
            Text("\(value.wrappedValue)")
                .font(.title2)
                .frame(width: 50, alignment: .center)
            Button(action: {
                value.wrappedValue += 1
            }) {
                Image(systemName: "plus.circle.fill")
                    .font(.title2)
            }
        }
        .foregroundColor(customDarkOrange) // Cambiado a naranja para representar la gasolina
    }
    .padding()
}

func toggleView3(question: String, isOn: Binding<Bool>) -> some View {
    Toggle(isOn: isOn) {
        Text(question)
            .bold()
    }
    .padding()
}

func pickerQuestionView3(question: String, selection: Binding<String>) -> some View {
    VStack {
        Text(question)
            .bold()
        Picker(question, selection: selection) {
            Text("Gasolina Regular").tag("Regular")
            Text("Gasolina Premium").tag("Premium")
            Text("Diésel").tag("Diésel")
        }
        .pickerStyle(SegmentedPickerStyle())
    }
    .padding()
}

let customDarkOrange = Color(red: 255/255, green: 165/255, blue: 0/255) // Cambiado a naranja para representar la gasolina




#Preview {
    GasView()
}
