//
//  LuzView.swift
//  GreenSteps
//
//  Created by iOS Lab on 24/04/24.
//

import SwiftUI



struct LuzView: View {
    @State private var numFocos = 0
    @State private var horasEncendido = 0
    @State private var porcentajeLED = 0
    @State private var usaTemporizadores = false
    @State private var tipoBombilla = ""
    @State private var showFinishView = false

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(spacing: 20) {
                        Text("Calcula tu huella de carbono por consumo de luz")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding()
                        
                        questionView(question: "¿Cuántos focos hay en tu casa?", value: $numFocos)
                        questionView(question: "¿Cuántas horas al día están encendidos en promedio?", value: $horasEncendido)
                        questionView(question: "¿Qué porcentaje de tus focos son LED?", value: $porcentajeLED)
                        toggleView(question: "¿Usas temporizadores o sistemas automáticos para apagar las luces?", isOn: $usaTemporizadores)
                        pickerQuestionView(question: "¿Cuál es el tipo de bombilla más común en tu hogar aparte de LED?", selection: $tipoBombilla)
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
    
    
    func calculateCarbonFootprint() -> CarbonFootprintData {
        
        let randomValue = Double.random(in: 0.0...100.0)
        return CarbonFootprintData(carbonFootprint: randomValue)
    }
}

struct CarbonFootprintData {
    var carbonFootprint: Double
    
}

struct FinishView: View {
    var carbonFootprintData: CarbonFootprintData
    @Binding var isPresented: Bool
   
    
    var body: some View {
        VStack {
            Spacer()
            Text("¡Gracias por calcular tu huella de carbono!")
                .font(.title)
                .padding()
            
            Text("Tu huella de carbono es de \(carbonFootprintData.carbonFootprint) kg de CO2.")
                .padding()
            
            
            Button(action: {
                withAnimation {
                    isPresented = false
                }
            }) {
                Image(systemName: "")
                    .foregroundColor(.green)
                
            }
            .padding()
        }
        .offset(y: isPresented ? 0 : UIScreen.main.bounds.height)
        .navigationBarBackButtonHidden(true) 
        .navigationBarItems(leading: EmptyView())
    }
}

// Funciones helper

func questionView(question: String, value: Binding<Int>) -> some View {
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
        .foregroundColor(customDarkGreen)
    }
    .padding()
}

func toggleView(question: String, isOn: Binding<Bool>) -> some View {
    Toggle(isOn: isOn) {
        Text(question)
            .bold()
    }
    .padding()
}

func pickerQuestionView(question: String, selection: Binding<String>) -> some View {
    VStack {
        Text(question)
            .bold()
        Picker(question, selection: selection) {
            Text("Incandescente").tag("Incandescente")
            Text("Fluorescente").tag("Fluorescente")
            Text("Otro").tag("Otro")
        }
        .pickerStyle(SegmentedPickerStyle())
    }
    .padding()
}

let customDarkGreen = Color(red: 24/255, green: 92/255, blue: 54/255)

struct LuzView_Previews: PreviewProvider {
    static var previews: some View {
        LuzView()
    }
}




