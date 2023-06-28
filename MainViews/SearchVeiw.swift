//
//  SearchVeiw.swift
//  Imetive
//
//  Created by 木本瑛介 on 2023/05/31.
//

import SwiftUI

struct SearchVeiw: View {
    @State var searchQuery: String = ""
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 23, weight: .bold))
                    .foregroundColor(.gray)
                TextField("検索", text: $searchQuery)
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(Color.primary.opacity(0.05))
            .cornerRadius(8)
            .frame(width: UIScreen.main.bounds.size.width - 25)
            .offset(y: 60)
            ScrollView {
                HStack(alignment: .center, spacing: 20) {
                    SearchBox(color: .red, title: "ジャンル", titleColor: .white)
                        .frame(width: 100, height: 100)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                  
                    
                    SearchBox(color: .green, title: "場所", titleColor: .white)
                        .frame(width: 100, height: 100)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                    
                }
                
                HStack(alignment: .center, spacing: 20) {
                    SearchBox(color: .blue, title: "急上昇", titleColor: .white)
                        .frame(width: 100, height: 100)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)

                    
                    SearchBox(color: .yellow, title: "近場", titleColor: .white)
                        .frame(width: 100, height: 100)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                    
                   
                }
                .padding(.top, 10)
                
            }
            .offset(y: 80)
        }
    }
}

struct SearchBox: View {
    var color: UIColor
    var title: String
    var titleColor: Color
    
    var body: some View {
        ZStack {
            Color(color)
                .ignoresSafeArea()
            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(titleColor)
        }
    }
}

struct SearchVeiw_Previews: PreviewProvider {
    static var previews: some View {
        SearchVeiw()
    }
}
