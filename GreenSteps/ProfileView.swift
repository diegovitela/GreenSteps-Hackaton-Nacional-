//
//  ContentView.swift
//  Profile
//
//  Created by Jp on 23/04/24.
//


import SwiftUI
import SceneKit
import UserNotifications

struct ProfileView: View {
    @State var scene: SCNScene? = .init(named: "arbol.scn")
    @State private var profileImage: Image? = nil

    let customGreen = Color(red: 100/255, green: 161/255, blue: 104/255)
    let customDarkGreen = Color(red: 24/255, green: 92/255, blue: 54/255)
    
    var body: some View {
        
            ScrollView {
                VStack(alignment: .center, spacing: 20) {
                    CustomSceneView(scene: $scene)
                        .frame(width: 250, height: 250)
                        .aspectRatio(contentMode: .fit)
                        
                    Text("Consejos y sugerencias personales")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(customGreen)
                        .multilineTextAlignment(.center)
                        .padding(.top)
                    
                    InfoRow(imageName: "hojas", text: "Reduce, reutiliza y recicla para disminuir la cantidad de desechos que produces.")
                    
                    InfoRow(imageName: "hojas", text: "Instala dispositivos de bajo flujo en grifos y duchas para reducir el consumo de agua.")
                    
                    InfoRow(imageName: "hojas", text: "Opta por productos con etiquetas ecológicas y de comercio justo siempre que sea posible.")
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding()
            }
            .navigationBarTitle(" ", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ProfileSettingsView()) {
                        if let image = profileImage {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                        } else {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                        }
                    }
                }
            }
            .onAppear(perform: loadProfileImage)
        
    }

    func loadProfileImage() {
        if let imageData = UserDefaults.standard.data(forKey: "profileImage"),
           let loadedImage = UIImage(data: imageData) {
            profileImage = Image(uiImage: loadedImage)
        }
    }
}

struct InfoRow: View {
    var imageName: String
    var text: String
    
    var body: some View {
        HStack(spacing: 10) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            
            Text(text)
                .font(.headline)
                .padding([.leading])
            
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
