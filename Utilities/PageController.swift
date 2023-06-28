//
//  PageController.swift
//  Imetive
//
//  Created by 木本瑛介 on 2023/05/29.
//

import Foundation
import SwiftUI

struct PageController: UIViewRepresentable {
    
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        
        control.addTarget(context.coordinator, action: #selector(Coordinator.updateCurrentPage(sender: )), for: .valueChanged)
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    class Coordinator {
        var control: PageController
        
        init(_ control: PageController) {
            self.control = control
        }
        
        @objc func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}
