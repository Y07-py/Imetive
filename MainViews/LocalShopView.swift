//
//  LocalShopView.swift
//  Imetive
//
//  Created by 木本瑛介 on 2023/05/29.
//

import SwiftUI

struct LocalShopView: View {
    
    @ObservedObject var dataFetchar: DataFetchar = DataFetchar()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(dataFetchar.shops) { data in
               VStack(alignment: .leading, spacing: 0) {
                   LocalShopTemplateView(shopModel: data, numberOfPage: data.shop_images?.count ?? 0)
               }.frame(width: getWindowSize().size.width, height: 450)
            }
        }
        .onAppear() {
                self.dataFetchar.fetchShopData()
        }
        .offset(y: 40)
        .padding()
        .safeAreaInset(edge: .top, spacing: 0) {
            Rectangle()
                .frame(width: UIScreen.main.bounds.size.height, height: 1.5)
                .offset(y: 56)
                .shadow(radius: 5, y: 5)
                .foregroundColor(.gray)
        }
    }
    
    func getWindowSize() -> CGRect {
        return UIScreen.main.bounds
    }
}
