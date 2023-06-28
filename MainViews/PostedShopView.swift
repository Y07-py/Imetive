//
//  PostedShopView.swift
//  Imetive
//
//  Created by 木本瑛介 on 2023/05/31.
//

import SwiftUI

struct PostedShopView: View {
    
    @State private var postedImage: Image?
    @State private var textField: String = ""
    @State private var shopName: String = ""
    @State private var isShowingSheet: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
                Button(action: {}) {
                    VStack(spacing: 0) {
                        Image(systemName: "paperplane.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.primary)
                        Text("シェアする")
                            .font(.system(size: 12, weight: .light))
                            .foregroundColor(.gray)
                            .padding(.top, 5)
                    }
                }
                .padding(.leading, UIScreen.main.bounds.size.width - 90)
                .padding(.top, 15)
                .shadow(radius: 4, x: 5, y: 5)
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("投稿画像を選択")
                            .font(.system(size: 16, weight: .light))
                            .foregroundColor(.primary)
                            .padding(.leading, 10)
                        Button(action: {}) {
                            if postedImage != nil {
                                postedImage!
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.size.width, height: 350)
                                    .foregroundColor(.primary)
                            } else {
                                ZStack {
                                    Color.gray
                                        .frame(width: UIScreen.main.bounds.size.width, height: 300)
                                    Image(systemName: "photo.fill")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.primary)
                                }
                            }
                        }
                    }
                    .padding()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("キャプション")
                            .font(.system(size: 16, weight: .light))
                            .padding(.leading, 10)
                        TextField("", text: $textField, axis: .vertical)
                            .font(Font.system(size: 16, design: .serif))
                            .frame(width: UIScreen.main.bounds.size.width - 20)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.gray)
                            .lineLimit(6, reservesSpace: true)
                            .overlay(
                                RoundedRectangle(cornerRadius: 2)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .onTapGesture {
                                self.isShowingSheet.toggle()
                            }
                            .sheet(isPresented: $isShowingSheet) {
                                TextFieldView(text: $textField, isShowingSheet: $isShowingSheet)
                            }
                        
                    }
                    .padding()
                    
                    NavigationLink(destination: SearchLocationView()) {
                        HStack {
                            Text("場所")
                                .font(Font.system(size: 16, design: .serif))
                                .foregroundColor(.primary)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .foregroundColor(.primary)
                        }
                        .frame(width: UIScreen.main.bounds.size.width - 20)
                    }
                    .padding()
                    
                    NavigationLink(destination: SearchUserView()) {
                        HStack {
                            Text("タグ付け")
                                .font(Font.system(size: 16, design: .serif))
                                .foregroundColor(.primary)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .foregroundColor(.primary)
                        }
                        .frame(width: UIScreen.main.bounds.size.width - 20)
                    }
                    .padding()
                    
                }
                .offset(y: 10)
                .padding()
                .safeAreaInset(edge: .top, spacing: 0) {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.size.width, height: 1.5)
                        .offset(y: 26)
                        .shadow(radius: 5, y: 5)
                        .foregroundColor(.gray)
                }
            }
    }
    
}

struct PostedShopView_Previews: PreviewProvider {
    static var previews: some View {
        PostedShopView()
    }
}
