//
//  TextFieldView.swift
//  Imetive
//
//  Created by 木本瑛介 on 2023/06/18.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var text: String
    @Binding var isShowingSheet: Bool
    
    var body: some View {
        VStack(alignment: .trailing) {
            Group {
                Button(action: {
                    self.isShowingSheet.toggle()
                }) {
                    ZStack {
                        Capsule()
                            .fill(Color.blue)
                            .frame(width: 40, height: 30)
                        Text("OK")
                            .font(Font.system(size: 16, design: .serif))
                            .frame(width: 40, height: 30)
                            .foregroundColor(.white)
                    }
                        
                }
    
                TextField("キャプション", text: $text, axis: .vertical)
                    .font(Font.system(size: 16, design: .serif))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.leading)
                    .lineLimit(6, reservesSpace: true)
                    .frame(width: UIScreen.main.bounds.size.width - 20)
                
            }.padding()
            Spacer()
        }
        
    }
}

