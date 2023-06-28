//
//  PageView.swift
//  Imetive
//
//  Created by 木本瑛介 on 2023/05/29.
//

import SwiftUI

struct PageView<Page: View>: View {
    
    var viewControllers: [Page]
    @State var currentPage: Int = 0
    
    var body: some View {
        VStack(alignment: .center) {
            PageViewController(pages: viewControllers, currentPage: $currentPage)
            PageController(numberOfPages: viewControllers.count, currentPage: $currentPage)
                .foregroundColor(.gray)
        }
    }
}

