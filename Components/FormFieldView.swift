//
//  FormFieldView.swift
//  Imetive
//
//  Created by 木本瑛介 on 2023/06/08.
//

import SwiftUI

struct FormFieldView: View {
    
    @Binding var value: String
    @Binding var isDisabled: Bool
    
    var icon: String
    var placeholder: String
    var isSecure: Bool = false
    
    var body: some View {
        Group {
            HStack {
                Image(systemName: icon)
                    .padding()
                Group {
                    if isSecure {
                        SecureField(placeholder, text: $value)
                            .disabled(isDisabled)
                    } else {
                        TextField(placeholder, text: $value)
                            .disabled(isDisabled)
                    }
                }
                .font(Font.system(size: 20, design: .serif))
                .foregroundColor(.primary)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.leading)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.none)
            }
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 4))
            .padding()
        }
    }
}

