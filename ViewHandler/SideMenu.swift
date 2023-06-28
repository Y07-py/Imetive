//
//  SideMenu.swift
//  Imetive
//
//  Created by 木本瑛介 on 2023/05/31.
//

import SwiftUI
import Kingfisher

struct SideMenu: View {
    
    @Binding var selectedTab: String
    @Binding var showMenu: Bool
    @Binding var x: CGFloat
    
    @Namespace var animation
    
    @EnvironmentObject var session: SessionStore
    
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading) {
                Spacer(minLength: 0)
//                Divider()
//                    .padding(.bottom, 10)
                NavigationLink(destination: ProfileView(profileImageUrl: session.session?.profileImageUrl, userName: (session.session?.userName)!, email: session.session?.email ?? "")) {
                    KFImage(URL(string: (session.session?.profileImageUrl)!))
                        .targetCache(ImageCacheType.defaultCache.getCache())
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70, height: 70)
                        .cornerRadius(10)
                }
                    
                    HStack(alignment: .top, spacing: 12) {
                        VStack(alignment: .leading, spacing: 12) {
                            Text((session.session?.userName)!)
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Text((session.session?.email)!)
                                .foregroundColor(.gray)
                            
                            HStack(spacing: 20) {
                                FollowVeiw(count: 0, title: "Following")
                                    .onTapGesture {
                                        
                                    }
                                
                                FollowVeiw(count: 100, title: "Follower")
                                    .onTapGesture {
                                        
                                    }
                            }
                            .padding(.top, 10)
                            
                            Divider()
                        }
                    
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    TabButton(image: "house", title: "Local", animation: animation, selectedTab: $selectedTab)
                    Divider().padding(.top)
                    TabButton(image: "house", title: "Surge", animation: animation, selectedTab: $selectedTab)
                    Divider().padding(.top)
                    TabButton(image: "house", title: "Posted", animation: animation, selectedTab: $selectedTab)
                    Divider().padding(.top)
                    TabButton(image: "house", title: "History", animation: animation, selectedTab: $selectedTab)
                    Divider().padding(.top)
                    TabButton(image: "magnifyingglass", title: "Search", animation: animation, selectedTab: $selectedTab)
                    
                }
             
                Spacer(minLength: 0)
            }
            .padding(.top, 60)
            .padding(.horizontal, 20)
            .padding(.bottom, edges!.bottom == 0 ? 15 : edges!.top)
            .padding(.bottom, edges!.bottom == 0 ? 15 : edges!.bottom)
            .frame(width: UIScreen.main.bounds.size.width - 90)
            .background(.white)
            .ignoresSafeArea(.all, edges: .vertical)
            
            Spacer(minLength: 0)
        }
        .background(Color.black.opacity(0).ignoresSafeArea(.all, edges: .vertical))
        
    }
}

struct FollowVeiw: View {
    var count: Int
    var title: String
    
    var body: some View {
        HStack {
            Text("\(count)")
                .fontWeight(.bold)
                .foregroundColor(.black)
            Text(title)
                .foregroundColor(.gray)
            
        }
    }
}

struct MenuButton: View {
    
    var title: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(title)
                .resizable()
                .renderingMode(.template)
                .frame(width: 24, height: 24)
                .foregroundColor(.gray)
            
            Text(title)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 12)
    }
}

