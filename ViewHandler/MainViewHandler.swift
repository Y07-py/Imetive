//
//  ViewHandler.swift
//  Imetive
//
//  Created by 木本瑛介 on 2023/05/31.
//

import SwiftUI

struct MainViewHandler: View {
    
    @State var selectedTab: String = "Local"
    @State var showMenu: Bool = false
    @State var width = UIScreen.main.bounds.size.width - 90
    @State var x = -UIScreen.main.bounds.width + 90
    @State var buttonX: CGFloat = 10
    
    var body: some View {
        GeometryReader { view1 in
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                Color.white.ignoresSafeArea()
                HomeView(selectedTab: $selectedTab)
                SideMenu(selectedTab: $selectedTab, showMenu: $showMenu, x: $x)
                    .background(Color.black.opacity(x == 0 ? 0.5 : 0).ignoresSafeArea(.all, edges: .vertical))
                    .offset(x: x)
            }
            .navigationTitle(Text(selectedTab))
            .navigationBarTitleDisplayMode(.inline)
            .ignoresSafeArea()
            .overlay(
                Button(action: {
                    withAnimation(.spring()) {
                        showMenu.toggle()
                        if showMenu {
                            buttonX = UIScreen.main.bounds.size.width - 160
                            x = 0
                        } else {
                            buttonX = 10
                            x = -width
                        }
                    }
                }) {
                    VStack(spacing: 5) {
                        Capsule()
                            .fill(Color.primary)
                            .frame(width: 30, height: 3)
                            .rotationEffect(.init(degrees: showMenu ? -50 : 0))
                            .offset(x: showMenu ? 2 : 0, y: showMenu ? 9 : 0)
                        VStack(spacing: 5) {
                            Capsule()
                                .fill(Color.primary)
                                .frame(width: 30, height: 3)
                            Capsule()
                                .fill(Color.primary)
                                .frame(width: 30, height: 3)
                                .offset(y: showMenu ? -8 : 0)
                        }
                        .rotationEffect(.init(degrees:  showMenu ? 50 : 0))
                    }
                }
                    .offset(x: buttonX)
                    .padding()
                , alignment: .topLeading
            )
            .shadow(radius: 3, y: 5)
            
        }
    }
    
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}

struct MainViewHandler_Previews: PreviewProvider {
    static var previews: some View {
        MainViewHandler()
    }
}
