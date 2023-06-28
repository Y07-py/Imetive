//
//  SearchBar.swift
//  Imetive
//
//  Created by 木本瑛介 on 2023/06/18.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText: String
    
    var searchTitle: String
    
    var body: some View {
        HStack(spacing: 15) {
            TextField(searchTitle, text: $searchText)
                .font(Font.system(size: 16, design: .serif))
                .multilineTextAlignment(.leading)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {}) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal)
        .background(Color.primary.opacity(0.05))
        .cornerRadius(8)
        .frame(width: UIScreen.main.bounds.size.width - 25)
    }
}


