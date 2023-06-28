//
//  SearchUserView.swift
//  Imetive
//
//  Created by 木本瑛介 on 2023/06/18.
//

import SwiftUI

struct SearchUserView: View {
    
    @State var userName: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            SearchBar(searchText: $userName, searchTitle: "人物を検索")
                .padding()
            
            ScrollView {
                
            }
        }
    }
}

struct SearchUserView_Previews: PreviewProvider {
    static var previews: some View {
        SearchUserView()
    }
}
