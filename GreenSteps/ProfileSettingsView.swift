//
//  ProfileSettingsView.swift
//  Profile
//
//  Created by Jp on 24/04/24.
//



import SwiftUI
import UserNotifications

struct ProfileSettingsView: View {
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var profileImage: Image?
    @State private var notificationsEnabled: Bool = false
    @State private var darkModeEnabled: Bool = false
    let customGreen = Color(red: 100/255, green: 161/255, blue: 104/255)
    let customDarkGreen = Color(red: 24/255, green: 92/255, blue: 54/255)

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personalización")) {
                    ProfileImageView(profileImage: $profileImage, showingImagePicker: $showingImagePicker)
                    Toggle("Habilitar Notificaciones", isOn: $notificationsEnabled)
                        .onChange(of: notificationsEnabled) { newValue in
                            if newValue {
                                requestAndScheduleNotifications()
                            } else {
                                cancelNotifications()
                            }
                        }
                    Toggle("Modo Oscuro", isOn: $darkModeEnabled)
                }
                Button(action: saveChanges) {
                    Text("Guardar Cambios")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(customGreen)
                        .cornerRadius(10)
                }
                Button(action: {
                    // Acción de cerrar sesión
                }) {
                    Text("Cerrar sesión")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.red)
                        .cornerRadius(10)
                }

            }
            .navigationBarTitle("Configuración del Perfil")
            .onAppear(perform: loadProfileImage)
        }
    }
    func requestAndScheduleNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                DispatchQueue.main.async {
                    scheduleNotifications()
                }
            } else {
                print("Notificaciones no permitidas")
            }
        }
    }

    func scheduleNotifications() {
        let content = UNMutableNotificationContent()
        content.title = "El mundo te necesita"
        content.body = "Ya puedes actualizar tus datos con tu recibo de luz mas reciente"
        content.sound = UNNotificationSound.default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60 * 20, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error al programar notificación: \(error.localizedDescription)")
            }
        }
    }

    func cancelNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }

    func saveChanges() {
            print("Configuraciones guardadas")
            if let inputImage = inputImage {
                if let imageData = inputImage.jpegData(compressionQuality: 1) {
                    UserDefaults.standard.set(imageData, forKey: "profileImage")
                }
            }
        }
    func loadProfileImage() {
            if let imageData = UserDefaults.standard.data(forKey: "profileImage"),
               let loadedImage = UIImage(data: imageData) {
                profileImage = Image(uiImage: loadedImage)
            }
        }
    }

struct ProfileSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingsView()
    }
}

struct ProfileImageView: View {
    @Binding var profileImage: Image?
    @State private var inputImage: UIImage?
    @Binding var showingImagePicker: Bool

    var body: some View {
        VStack {
            if let image = profileImage {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding()
            } else {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding()
            }

            Button("Seleccionar Foto") {
                self.showingImagePicker = true
            }
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: $inputImage)
        }
    }

    func loadImage() {
        guard let inputImage = self.inputImage else { return }
        profileImage = Image(uiImage: inputImage)
        saveImage(inputImage: inputImage)
    }

    func saveImage(inputImage: UIImage) {
        if let imageData = inputImage.jpegData(compressionQuality: 0.5) {  // Compresión para reducir el tamaño del archivo
            UserDefaults.standard.set(imageData, forKey: "profileImage")
        }
    }
}




struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.image = image
            }

            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
