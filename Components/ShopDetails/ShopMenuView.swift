//
//  ShopMenuView.swift
//  Imetive
//
//  Created by 木本瑛介 on 2023/06/04.
//

import SwiftUI
import Kingfisher

struct ShopMenuView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var shopMenu: [Items]?
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    ForEach(shopMenu ?? [], id: \.self) { menu in
                        HStack(alignment: .top) {
                            KFImage(URL(string: menu.img?.absoluteString ?? ""))
                                .targetCache(ImageCacheType.restaurantCache.getCache())
                                .resizable()
                                .frame(width: 100, height: 80)
                                .aspectRatio(contentMode: .fit)
                                .padding()
                                .shadow(color: .gray, radius: 4, x: 5, y: 5)
                                .offset(y: 10)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text(menu.title?.trimmingCharacters(in: .whitespaces) ?? "")
                                    .font(.system(size: 10, weight: .semibold))
                                Text(menu.price?.trimmingCharacters(in: .whitespaces) ?? "")
                                    .font(.system(size: 10, weight: .semibold))
                                    .foregroundColor(.gray)
                                Text(menu.course_rule?.replacingOccurrences(of: " ", with: "")
                                    .trimmingCharacters(in: .newlines) ?? "")
                                    .font(.system(size: 10, weight: .semibold))
                                    
                                    
                            }
                            .padding()
                        }
                        Divider()
                    }
                    .padding()
                    Divider()
                    
                }
            }
        }
    }
}

