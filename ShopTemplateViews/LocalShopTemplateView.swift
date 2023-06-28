//
//  LocalShopTemplateView.swift
//  Imetive
//
//  Created by 木本瑛介 on 2023/05/27.
//

import SwiftUI
import Kingfisher

struct LocalShopTemplateView: View {
    
    @State var currentPage: Int = 0
    @State var isGood: Bool = false
    
    var shopModel: ShopModel
    
    var numberOfPage: Int
    
    var body: some View {
        GeometryReader { view in
            VStack(alignment: .leading, spacing: 0) {
                NavigationLink(destination: ShopDetailsView(shopModel: shopModel, coordinate: .init(latitude: shopModel.coordinates[1], longitude: shopModel.coordinates[0]))) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(shopModel.shop_name ?? "")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.primary)
                            .frame(height: 40)
                            .clipped()
                            .lineLimit(2)
                        Text(shopModel.address ?? "")
                            .font(.system(size: 10, weight: .semibold))
                            .foregroundColor(.gray)
                            .clipped()
                            .frame(height: 10)
                    }
                }
                .offset(x: 20)
                TabView() {
                    ForEach(shopModel.shop_images ?? [], id: \.self) { url in
                        KFImage(URL(string: url.absoluteString))
                            .targetCache(ImageCacheType.restaurantCache.getCache())
                            .resizable()
                            .frame(height: 350)
                            .aspectRatio(contentMode: .fit)
                            .onTapGesture(count: 2) {
                                withAnimation {
                                    self.isGood.toggle()
                                }
                            }
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(height: 300)
                .offset(y: 10)
                .shadow(radius: 5, y: 4)
                TemplateBottomView(isGood: $isGood)
                    .offset(y: 10)
            }
        }
        .padding(.top, 20)
    }
    
    func getWindowSize() -> CGRect {
        return UIScreen.main.bounds
    }
}


