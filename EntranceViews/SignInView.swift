//
//  SignInView.swift
//  Imetive
//
//  Created by 木本瑛介 on 2023/06/08.
//

import SwiftUI

struct SignInView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showingProgressView: Bool = false
    @State private var error: String = ""
    @State private var showingAlert: Bool = false
    @State private var alertTitle: String = "Error"
    
    func errorCheck() -> String? {
        if email.trimmingCharacters(in: .whitespaces).isEmpty ||
            password.trimmingCharacters(in: .whitespaces).isEmpty {
            return "Please fill in all fields and provide an Image"
        }
        return nil
    }
    
    func clear() {
        self.email = ""
        self.password = ""
        self.showingProgressView = false
    }
    
    func signIn() {
        if let error = errorCheck() {
            self.error = error
            self.showingAlert = true
            self.showingProgressView = false
            return
        }
        AuthService.signIn(email: email, password: password) { user in
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
        VStack(spacing: 20) {
            
            VStack(alignment: .leading) {
                FormFieldView(value: $email, isDisabled: $showingProgressView, icon: "envelope.fill", placeholder: "Email")
                FormFieldView(value: $password, isDisabled: $showingProgressView, icon: "lock.fill", placeholder: "Password", isSecure: true)
                
                Button(action: {
                    self.showingProgressView = true
                    signIn()
                }) {
                    Text("Sign In")
                        .font(.title)
                        .modifier(ButtonModifire())
                }
            }
            
            HStack {
                Text("New?")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.primary)
                NavigationLink(destination: SignUpView()) {
                    Text("Create a New Account")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.primary)
                }
            }
        }
        .padding()
    }
}

struct SignInViewPreview: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
