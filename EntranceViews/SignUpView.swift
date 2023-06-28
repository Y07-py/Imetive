//
//  SignUpView.swift
//  Imetive
//
//  Created by 木本瑛介 on 2023/06/08.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var userName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var profileImage: Image?
    @State private var pickedImage: Image?
    @State private var showingActionSheet: Bool = false
    @State private var showingImagepicker: Bool = false
    @State private var imageData: Data = Data()
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var error: String = ""
    @State private var showingAlert: Bool = false
    @State private var alertTitle: String = "Error."
    @State private var showingProgressView: Bool = false
    
    func loadImage() {
        guard let inputImage = pickedImage else { return }
        profileImage = inputImage
    }
    
    func errorCheck() -> String? {
        if email.trimmingCharacters(in: .whitespaces).isEmpty ||
            password.trimmingCharacters(in: .whitespaces).isEmpty ||
            userName.trimmingCharacters(in: .whitespaces).isEmpty ||
            imageData.isEmpty {
            self.showingProgressView = false
            return "Please fill in all fields and provide an image"
        }
        return nil
    }
    
    func clear() {
        self.email = ""
        self.userName = ""
        self.password = ""
        self.profileImage = nil
    }
    
    func signUp() {
        if let error = errorCheck() {
            self.error = error
            self.showingAlert = true
            self.showingProgressView = false
            return
        }
        AuthService.signUp(userName: userName, email: email, password: password, imageData: imageData) { user in
            self.showingProgressView = false
            clear()
        } onError: { errorMessage in
            print(errorMessage)
            self.error = errorMessage
            self.showingAlert = true
            self.showingProgressView = false
            return
        }
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 20) {
                    VStack(alignment: .center, spacing: 0) {
                        Button(action: {
                            showingActionSheet.toggle()
                        }) {
                            if profileImage == nil {
                                Image(systemName: "person.circle.fill")
                                    .font(.system(size: 90, weight: .black, design: .monospaced))
                                    .foregroundColor(.primary)
                                    .padding(.top, 10)
                            } else {
                                profileImage?.resizable()
                                    .clipShape(Circle())
                                    .frame(width: 100, height: 100)
                                    .padding(.top, 10)
                            }
                        }
                        Text("アカウントのアイコン選択")
                            .font(.system(size: 16, weight: .heavy))
                            .padding(.top, 10)
                    }
                    
                    Group {
                        FormFieldView(value: $userName, isDisabled: $showingProgressView, icon: "person.fill", placeholder: "UserName")
                        FormFieldView(value: $email, isDisabled: $showingProgressView,icon: "envelope.fill", placeholder: "Email")
                        FormFieldView(value: $password, isDisabled: $showingProgressView,icon: "lock.fill", placeholder: "Password", isSecure: true)
                    }
                    
                    Button(action: {
                        self.showingProgressView = true
                        signUp()
                    }) {
                        Text("Sign Up")
                            .font(.title)
                            .modifier(ButtonModifire())
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text(alertTitle), message: Text(error), dismissButton: .default(Text("OK")))
                    }
                    .disabled(showingProgressView)
                    
                }
                .padding()
            }
            .sheet(isPresented: $showingImagepicker, onDismiss: loadImage) {
                ImagePicker(pickerImage: $pickedImage, showImagePicker: $showingImagepicker, imageData: $imageData)
            }
            .actionSheet(isPresented: $showingActionSheet) {
                ActionSheet(title: Text(""), buttons: [
                    .default(Text("Choose a Photo")) {
                        self.sourceType = .photoLibrary
                        self.showingImagepicker = true
                    },
                    .default(Text("Take a Photo")) {
                        self.sourceType = .camera
                        self.showingImagepicker = true
                    },
                    .cancel()
                    
                ])
            }
            .opacity(self.showingProgressView ? 0.5 : 1.0)
            
            if self.showingProgressView {
                ProgressView()
                    .progressViewStyle(.circular)
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
