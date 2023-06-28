//
//  SearchLocationView.swift
//  Imetive
//
//  Created by 木本瑛介 on 2023/06/18.
//

import SwiftUI

struct SearchLocationView: View {
    
    @State var searchLocation: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            SearchBar(searchText: $searchLocation, searchTitle: "場所を検索")
                .padding()
            
            ScrollView {
                
            }
        }
    }
}

struct SearchLocationView_Previews: PreviewProvider {
    static var previews: some View {
        SearchLocationView()
    }
}
