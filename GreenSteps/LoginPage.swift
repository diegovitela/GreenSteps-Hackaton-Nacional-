//
//  LoginPage.swift
//  GreenSteps
//
//  Created by iOS Lab on 23/04/24.
//
import SwiftUI

struct LoginPage: View {
    @Binding var isLoggedIn: Bool
    @State private var username = ""
    @State private var password = ""
    @State private var isBlankPageActive = false // Estado para activar la página en blanco
    @State private var isWarningVisible = false // Estado para controlar la visibilidad del mensaje de advertencia

    var body: some View {
        ZStack {
            // Fondo general de la vista
            Color(hex: "#64a168").ignoresSafeArea()
            
            VStack {
                // Carta de advertencia
                if isWarningVisible {
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.red)
                                .frame(width: UIScreen.main.bounds.width - 40, height: 60)
                                .shadow(radius: 5)
                            
                            Text("¡Le faltaron campos por llenar!")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                        .transition(.move(edge: .top)) // Animación para desplazar la carta desde arriba
                        .padding(.bottom, 20) // Espaciado inferior para evitar superposiciones
                    }
                    .padding(.top, 20) // Espaciado superior para la carta
                }
                
                Spacer() // Espaciador superior para centrar la imagen
                
                // Imagen en el medio de la página
                Image("your_image_name") // Reemplaza "your_image_name" con el nombre de tu imagen
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200) // Ajusta el tamaño de la imagen según sea necesario
                Spacer()
                
                // Texto de bienvenida
                Text("Bienvenidos")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                
                // Texto adicional
                Text("Por favor, registra sesión")
                    .font(.footnote)
                    .foregroundColor(.white)
                    .padding(.bottom, 5) // Añade espacio inferior
                
                Spacer(minLength: UIScreen.main.bounds.height / 4) // Ajusta el espaciador para elevar la carta
                
                loginCard
                    .frame(height: UIScreen.main.bounds.height / 2)
                
                // Mensaje de error
                if isWarningVisible {
                    Text("Por favor, complete todos los campos")
                        .foregroundColor(.red)
                        .padding(.top, 10)
                }
                
                Spacer() // Espaciador inferior para ajustar la ubicación de los botones
            }
        }
        .navigationBarHidden(true)
    }
    
    var loginCard: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color(hex: "#185c36"))
            .shadow(radius: 10) // Añade sombra para un efecto 3D
            .overlay(
                VStack {
                    // Espacio para usuario y contraseña
                    VStack {
                        TextField("Usuario", text: $username)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20)
                            .padding(.horizontal)
                        
                        SecureField("Contraseña", text: $password)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20)
                            .padding(.horizontal)
                    }
                    
                    // Botón de enviar
                    NavigationLink(destination: BlankPageView().navigationBarBackButtonHidden(true), isActive: $isBlankPageActive) {
                        Text("Enviar")
                            .fontWeight(.bold)
                            .foregroundColor(.black) // Cambia el color del texto a negro
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white) // Cambia el fondo a blanco
                            .cornerRadius(40)
                            .onTapGesture {
                                if username.isEmpty || password.isEmpty {
                                    isWarningVisible = true // Muestra la carta de advertencia si hay campos vacíos
                                } else {
                                    isBlankPageActive = true // Activa la página en blanco si todo está completo
                                }
                            }
                    }
                    .padding()
                    
                    // Línea blanca separadora
                    Divider()
                        .background(Color.white)
                        .padding(.horizontal)
                    
                    // Botón de Google
                    NavigationLink(destination: BlankPageView().navigationBarBackButtonHidden(true), isActive: $isBlankPageActive) {
                        HStack {
                            Image("google") // Sustituye "google" por el nombre de tu imagen
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 32, height: 32) // Ajusta el tamaño de la imagen aquí
                                .foregroundColor(.red)
                            Text("Iniciar sesión con Google")
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(40)
                        .onTapGesture {
                            isBlankPageActive = true // Activa la página en blanco al presionar el botón
                        }
                    }
                    .padding()
                }
            )
            .padding([.horizontal], 1) // Ajusta el padding solo horizontal y muy pequeño
    }
}
























