//
//  RegistrationView.swift
//  Sociales
//
//  Created by NomoteteS on 23.02.2023.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var fullname = ""
    @State private var username = ""
    @State private var password = ""
    @State private var selectedImage: UIImage?
    @State private var image: Image?
    @State var imagePickerPresented = false
    @EnvironmentObject var viewModel: AuthViewModel

    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.pink]),
                                       startPoint: .top,
                                       endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                //MARK: RegistrationView Image Upload
                VStack {
                    if let image = image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140,
                                   height: 140)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    } else {
                        Button {
                            imagePickerPresented.toggle()
                        } label: {
                            VStack {
                                Image(systemName: "plus")
                                    .font(.system(.largeTitle, weight: .black))
                                    .padding()
                                Text("Add Image")
                            }
                            .tint(.white)
                        }
                        .sheet(isPresented: $imagePickerPresented,
                               onDismiss: loadImage) {
                            ImagePicker(image: $selectedImage)
                        }
                    }
                }
                .padding()
                //MARK: - RegistrationView email & password fields
                VStack(spacing: 20) {
                    // email field
                    CustomTextField(text: $email,
                                    placeholder: Text("Email"),
                                    imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal,32)
                    
                    CustomTextField(text: $fullname,
                                    placeholder: Text("Fullname"),
                                    imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal,32)
                    
                    CustomTextField(text: $username,
                                    placeholder: Text("Username"),
                                    imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal,32)
                    // password field
                    CustomSecureField(text: $password,
                                      placeholder: Text("Password"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal,32)
                }
                // MARK: - RegistrationView forgot password
                HStack {
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Forgot Password?")
                            .font(.system(.caption))
                            .foregroundColor(.white)
                    }
                    .padding(.init(top: 10,
                                   leading: 0,
                                   bottom: 0,
                                   trailing: 40))
                }
                // MARK: - RegistrationView sign up
                Button {
                    viewModel.regsiter(withEmail: email,
                                       password: password,
                                       image: selectedImage,
                                       fullname: fullname,
                                       username: username)
                } label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background(Color(UIColor.separator))
                        .clipShape(Capsule())
                        .padding()
                }
                
                Spacer()
                
                // MARK: - RegistrationView go to sign in
                
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(.caption2))
                        
                        Text("Sign In")
                            .font(.system(.caption2,weight: .semibold))
                    }
                    .foregroundColor(.white)
                }
            }
        }
    }
}

extension RegistrationView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        image = Image(uiImage: selectedImage)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
