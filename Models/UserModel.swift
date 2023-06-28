//
//  UserModel.swift
//  Imetive
//
//  Created by 木本瑛介 on 2023/06/09.
//

import Foundation
import FirebaseFirestoreSwift

struct UserModel: Encodable, Decodable, Identifiable {
    var id: String = UUID().uuidString
    var uid: String?
    var userName: String?
    var email: String
    var profileImageUrl: String?
    var searchName: [String]?
    var bio: String?
}
