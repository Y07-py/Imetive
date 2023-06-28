//
//  CustomCorners.swift
//  Imetive
//
//  Created by 木本瑛介 on 2023/05/31.
//

import Foundation
import SwiftUI

struct CustomCorners: Shape {
    
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
