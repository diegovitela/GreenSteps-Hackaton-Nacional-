//
//  ThirdView.swift
//  GreenSteps
//
//  Created by iOS Lab on 23/04/24.
//

import SwiftUI

struct ThirdView: View {
    let customGreen = Color(red: 100/255, green: 161/255, blue: 104/255) // Definir el color personalizado
    let customDarkGreen = Color(red: 24/255, green: 92/255, blue: 54/255) // Definir el color personalizado
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            VStack { // VStack para el texto "Buenos días" y la imagen
                Text("Buenos días")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.top)
                
                Image("arbol") // Agrega el nombre de tu imagen
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250)
                
                Text("Consejos y sugerencias personales")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(customGreen) // Cambiar el color del texto
                    .multilineTextAlignment(.center)
                    .padding(.top)
            }
            
            InfoRow(imageName: "hojas", text: "Considera usar transporte público o bicicletas de vez en cuando en la semana")
            
            InfoRow(imageName: "hojas", text: "Reduce el consumo de carne roja a una vez por semana")
            
            InfoRow(imageName: "hojas", text: "Apaga los dispositivos eléctricos cuando no estén en uso")
            
            Spacer() // Agregar espacio entre los elementos y el botón
            
            Button(action: {
                // Acción que se ejecuta cuando se presiona el botón "Cerrar sesión"
                // Aquí puedes agregar el código para cerrar la sesión del usuario
            }) {
                Text("Cerrar sesión")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(customGreen) // Usar el color personalizado como fondo
                    .cornerRadius(10)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
    }
}

struct InfoRow: View {
    var imageName: String
    var text: String
    
    var body: some View {
        HStack(spacing: 10) {
            Image(imageName) // Usando el nombre de la imagen personalizada
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            
            Text(text)
                .font(.headline)
                .padding([.leading])
            
            Spacer() // Añadir espacio al final
        }
    }
}





