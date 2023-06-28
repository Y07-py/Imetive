//
//  TemplateBottomBiew.swift
//  Imetive
//
//  Created by 木本瑛介 on 2023/05/29.
//

import SwiftUI

struct TemplateBottomView: View {
    
    @State var isarchive: Bool = false
    
    @Binding var isGood: Bool
    
    
    var body: some View {
        HStack() {
            Button(action: {
                self.isGood.toggle()
            }) {
                Group {
                    if isGood {
                        Image(systemName: "hand.thumbsup.fill")
                            .resizable()
                    }
                    else {
                        Image(systemName: "hand.thumbsup")
                            .resizable()
                    }
                }
                .frame(width: 20, height: 20)
                .foregroundColor(.primary)
            }
            Spacer().frame(width: 10)
            Text("1200")
                .font(.system(size: 15, weight: .light))
                .foregroundColor(.gray)
            Spacer().frame(width: 30)
            Button(action: {}) {
                Image(systemName: "message")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.primary)
            }
            
            Spacer().frame(width: getWindowSize().size.width - 180)
            Button(action: {
                self.isarchive.toggle()
            }) {
                Group {
                    if isarchive {
                        Image(systemName: "archivebox.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                    } else {
                        Image(systemName: "archivebox")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                }
                .foregroundColor(.primary)
            }
            Spacer().frame(width: 20)
        }
        .frame(width: getWindowSize().size.width)
        .padding()
    }
    
    func getWindowSize() -> CGRect {
        return UIScreen.main.bounds
    }
}

