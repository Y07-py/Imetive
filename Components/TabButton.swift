//
//  TabButton.swift
//  Imetive
//
//  Created by 木本瑛介 on 2023/05/31.
//

import SwiftUI

struct TabButton: View {
    var image: String
    var title: String
    var animation: Namespace.ID
    
    
    @Binding var selectedTab: String
    
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selectedTab = title
            }
        }) {
            HStack(spacing: 10) {
                Image(systemName: image)
                    .foregroundColor(.gray)
                    .font(.title2)
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundColor(selectedTab == title ? .black : .gray)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 20)
        }
    }
}


