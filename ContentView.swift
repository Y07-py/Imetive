//
//  ContentView.swift
//  Imetive
//
//  Created by 木本瑛介 on 2023/05/27.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionStore
    
    func listen() {
        session.listen()
    }
    
    var body: some View {
        Group {
            if session.session != nil {
                MainViewHandler()
            } else {
                ZStack {
                    SignInView()
                        .opacity(session.showingProgressView ? 0.5 : 1.0)
                    if session.showingProgressView {
                        ProgressView()
                            .progressViewStyle(.circular)
                    }
                }
            }
        }
        .onAppear {
            listen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SessionStore())
    }
}
