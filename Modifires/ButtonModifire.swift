//
//  ButtonModifire.swift
//  Imetive
//
//  Created by 木本瑛介 on 2023/06/08.
//

import SwiftUI

struct ButtonModifire: ViewModifier {
    
    var backgroundColor: Color = .black
    
    func body(content: Content) -> some View {
        content
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 20)
            .padding()
            .foregroundColor(.white)
            .font(.system(size: 14, weight: .black))
            .background(backgroundColor)
            .cornerRadius(5.0)
    }
}

