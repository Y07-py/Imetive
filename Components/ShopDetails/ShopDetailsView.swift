//
//  ShopDetailsView.swift
//  Imetive
//
//  Created by 木本瑛介 on 2023/05/29.
//

import SwiftUI
import Kingfisher
import MapKit

struct ShopDetailsView: View {
    
    @State var isShowingMap: Bool = false
    @State var isShowingSheet: Bool = false
    @State var mapHeight: CGFloat = 300
    
    var shopModel: ShopModel
    var coordinate: CLLocationCoordinate2D
    
    var body: some View {
        ZStack {
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 0) {
                            Text(shopModel.shop_name ?? "")
                                .font(.system(size: 18, weight: .bold))
                                .offset(x: 10)
                            Group {
                                if shopModel.budget_lunch != nil {
                                    HStack {
                                        Image(systemName: "sun.max.fill")
                                            .resizable()
                                            .frame(width: 12, height: 12)
                                        Text(shopModel.budget_lunch!)
                                            .font(.system(size: 12, weight: .thin))
                                    }
                                }
                                if shopModel.budget_dinner != nil {
                                    HStack {
                                        Image(systemName: "moon.fill")
                                            .resizable()
                                            .frame(width: 12, height: 12)
                                        Text(shopModel.budget_dinner!)
                                            .font(.system(size: 12, weight: .thin))
                                    }
                                }
                            }
                            .offset(x: 10)
                        }
                        Spacer()
                        
                        NavigationLink(destination: MapView(location: coordinate)) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .fill(Color.blue.opacity(0.8))
                                    .frame(width: 90, height: 50)
                                
                                HStack {
                                    Image(systemName: "map")
                                        .resizable()
                                        .frame(width: 18, height: 18)
                                        .foregroundColor(.primary)
                                    Text("マップ")
                                        .font(.system(size: 18, weight: .bold))
                                        .foregroundColor(.primary)
                                }
                            }
                        }
                        .padding()
                    }
                    .shadow(color: .gray, radius: 4, x: 5, y: 5)
                    
                    
                    TabView {
                        ForEach(shopModel.shop_images ?? [], id: \.self) { url in
                            KFImage(URL(string: url.absoluteString))
                                .targetCache(ImageCacheType.restaurantCache.getCache())
                                .resizable()
                                .frame(height: 300)
                                .aspectRatio(contentMode: .fit)
                            
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .frame(height: 300)
                    .offset(y: 10)
                    
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("メニュー")
                            .font(.system(size: 25, weight: .bold))
                            .padding()
                        
                        HStack(alignment: .center) {
                            NavigationLink(destination: ShopMenuView(shopMenu: shopModel.foods_list?.course)) {
                                VStack(spacing: 0) {
                                    Image("menu")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                    Text("コース")
                                        .font(.system(size: 20, weight: .semibold))
                                }
                            }
                            .disabled(shopModel.foods_list?.course?.isEmpty ?? true)
                            .padding()
                            
                            NavigationLink(destination: ShopMenuView(shopMenu: shopModel.foods_list?.dtlmenu)) {
                                VStack(spacing: 0) {
                                    Image("course")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                    Text("料理")
                                        .font(.system(size: 20, weight: .semibold))
                                }
                            }
                            .disabled(shopModel.foods_list?.dtlmenu?.isEmpty ?? true)
                            .padding()
                            
                            NavigationLink(destination: ShopMenuView(shopMenu: shopModel.foods_list?.drink)) {
                                VStack(spacing: 0) {
                                    Image("drink")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                    Text("ドリンク")
                                        .font(.system(size: 20, weight: .semibold))
                                }
                            }
                            .disabled(shopModel.foods_list?.drink?.isEmpty ?? true)
                            .padding()
                            
                            NavigationLink(destination: ShopMenuView(shopMenu: shopModel.foods_list?.lunch)) {
                                VStack(spacing: 0) {
                                    Image("lunch")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                    Text("ランチ")
                                        .font(.system(size: 20, weight: .semibold))
                                }
                                
                            }
                            .disabled(shopModel.foods_list?.lunch?.isEmpty ?? true)
                            .padding()
                        }
                    }
                    .foregroundColor(.primary)
                    .offset(y: 20)
                    
                    Divider()
                        .offset(y: 20)
                    
                    
                    
                }
            }
        }
    }
}

