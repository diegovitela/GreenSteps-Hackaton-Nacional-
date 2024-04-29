//
//  AguaView.swift
//  GreenSteps
//
//  Created by iOS Lab on 24/04/24.
//

import SwiftUI

struct AguaView: View {
    @State private var numPersonas = 0
    @State private var minutosDucha = 0
    @State private var vecesLavavajillas = 0
    @State private var usoGrifo = false
    @State private var tipoAgua = ""
    @State private var showFinishView = false

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(spacing: 20) {
                        Text("Calcula tu huella de carbono por consumo de agua")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding()
                        
                        questionView(question: "¿Cuántas personas viven en tu hogar?", value: $numPersonas)
                        questionView(question: "¿Cuántos minutos dura tu ducha promedio?", value: $minutosDucha)
                        questionView(question: "¿Cuántas veces a la semana usas el lavavajillas?", value: $vecesLavavajillas)
                        toggleView(question: "¿Dejas el grifo abierto mientras te lavas los dientes o las manos?", isOn: $usoGrifo)
                        
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
    
    // Función para calcular la huella de carbono por consumo de agua
    func calculateCarbonFootprint() -> CarbonFootprintData {
        // Implementa aquí la lógica para calcular la huella de carbono basada en las respuestas del usuario
        // Por ahora, solo devolveremos un valor aleatorio para demostrar
        let randomValue = Double.random(in: 0.0...100.0)
        return CarbonFootprintData(carbonFootprint: randomValue)
    }
}

struct CarbonFootprintData2 {
    var carbonFootprint: Double
    // Puedes agregar más propiedades según sea necesario para representar los datos de la huella de carbono
}

struct FinishView2: View {
    var carbonFootprintData: CarbonFootprintData
    @Binding var isPresented: Bool // Binding para controlar la visibilidad de la vista LuzView
    
    var body: some View {
        VStack {
            Spacer() // Agrega espacio para empujar la carta hacia abajo
            Text("¡Gracias por calcular tu huella de carbono por consumo de agua!")
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
                    .foregroundColor(.blue) // Cambia el color de la flecha a azul para representar el agua
            }
            .padding()
        }
        .offset(y: isPresented ? 0 : UIScreen.main.bounds.height) // Desplaza la vista hacia abajo cuando isPresented es falso
        .navigationBarBackButtonHidden(true) // Oculta el botón de retroceso predeterminado
        .navigationBarItems(leading: EmptyView()) // Asegura que no haya ningún elemento de navegación en la barra
    }
}

// Funciones helper

func questionView2(question: String, value: Binding<Int>) -> some View {
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
        .foregroundColor(customDarkBlue) // Cambiado a azul para representar el agua
    }
    .padding()
}

func toggleView2(question: String, isOn: Binding<Bool>) -> some View {
    Toggle(isOn: isOn) {
        Text(question)
            .bold()
    }
    .padding()
}

func pickerQuestionView2(question: String, selection: Binding<String>) -> some View {
    VStack {
        Text(question)
            .bold()
        Picker(question, selection: selection) {
            Text("Agua del grifo").tag("Grifo")
            Text("Agua embotellada").tag("Embotellada")
            Text("Agua filtrada").tag("Filtrada")
        }
        .pickerStyle(SegmentedPickerStyle())
    }
    .padding()
}

let customDarkBlue = Color(red: 24/255, green: 92/255, blue: 190/255) // Cambiado a azul para representar el agua


#Preview {
    AguaView()
}
