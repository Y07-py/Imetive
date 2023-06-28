//
//  ProfileView.swift
//  Imetive
//
//  Created by 木本瑛介 on 2023/06/03.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    
    @State var profileImageUrl: String?
    @State var userName: String
    @State var email: String
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button(action: {}) {
                    Image(systemName: "message.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 20, height: 20)
                        .foregroundColor(.primary)
                }
                .padding(.trailing, 10)
                Button(action: {}) {
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 20, height: 20)
                        .foregroundColor(.primary)
                }
            }
            .padding(.leading, UIScreen.main.bounds.size.width - 100)
            
            HStack {
                KFImage(URL(string: profileImageUrl ?? ""))
                    .targetCache(ImageCacheType.defaultCache.getCache())
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(userName)
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.primary)
                    Text(email)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.gray)
                    
                    HStack {
                        NavigationLink(destination: FollowersView()) {
                            VStack(alignment: .leading) {
                                Text("Followers")
                                    .font(.system(size: 16, weight: .light))
                                    .foregroundColor(.gray)
                                Text("100")
                                    .font(.system(size: 15, weight: .light))
                                    .foregroundColor(.primary)
                            }
                        }
                        Spacer()
                        NavigationLink(destination: FollowersView()) {
                            VStack(alignment: .leading) {
                                Text("Following")
                                    .font(.system(size: 16, weight: .light))
                                    .foregroundColor(.gray)
                                Text("100")
                                    .font(.system(size: 15, weight: .light))
                                    .foregroundColor(.primary)
                            }
                        }
                        
                    }
                    .padding(.top, 10)
                }
                .padding()
            }
            .padding()
            .shadow(radius: 4, x:5, y: 5)
            
            Group {
                Text("Hi!, my name is Katty!")
                    .font(.system(size: 14, weight: .light))
                    .foregroundColor(.primary)
                    .frame(width: UIScreen.main.bounds.size.width)
            }
            .padding()
            
            Button(action: {}) {
                Text("プロフィールを編集する")
                    .font(.system(size: 18, weight: .bold))
                    .modifier(ButtonModifire(backgroundColor: .blue))
            }
            .padding()
            
            Divider()
            
            VStack(alignment: .leading) {
                Text("投稿一覧")
                    .font(.system(size: 16, weight: .light))
                    .foregroundColor(.primary)
                    .padding(.top, 10)
                    .padding(.leading, 10)
                ScrollView(showsIndicators: false) {
                    
                }
            }
        }
    }
}

