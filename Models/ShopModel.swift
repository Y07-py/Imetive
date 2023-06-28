//
//  ShopModel.swift
//  Imetive
//
//  Created by 木本瑛介 on 2023/05/27.
//

import Foundation
import FirebaseFirestoreSwift

struct ShopModel: Codable, Identifiable {
    @DocumentID var id: String? = UUID().uuidString
    var shop_name: String?
    var address: String?
    var budget_dinner: String?
    var budget_lunch: String?
    var coordinates: [Double]
    var pay_items: [String]?
    var reserve_status: String?
    var shop_images: [URL]?
    var shop_tel: String?
    var sns_link: [URL]?
    var subject_text: String?
    var table: String?
    var form_line: String?
    var homepage_link: String?
    var foods_list: FoodsList?
    
    enum CodingKeys: String, CodingKey {
        case id
        case shop_name
        case address
        case budget_dinner
        case budget_lunch
        case coordinates
        case pay_items
        case reserve_status
        case shop_images
        case shop_tel
        case sns_link
        case subject_text
        case table
        case form_line
        case homepage_link
        case foods_list
    }
    
    enum foodsType: String {
        case course = "course"
        case dish = "dish"
        case drink = "drink"
        case lunch = "lunch"
    }
}

struct FoodsList: Codable, Hashable{
    var course: [Items]?
    var drink: [Items]?
    var dtlmenu: [Items]?
    var lunch: [Items]?
    
    enum CodingKeys: String, CodingKey{
        case course
        case drink
        case dtlmenu
        case lunch
    }
}

struct Items: Codable, Hashable{
    var course_rule: String?
    var img: URL?
    var price: String?
    var title: String?
    
    enum CodingKeys: String, CodingKey {
        case course_rule
        case img
        case price
        case title
    }
}

struct Geometry: Codable, Hashable {
    var longtitude: Double
    var latitude: Double
    
    enum CodingKeys: String, CodingKey {
        case longtitude
        case latitude
    }
}



