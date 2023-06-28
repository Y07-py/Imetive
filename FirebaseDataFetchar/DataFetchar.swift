//
//  DataFetchar.swift
//  Imetive
//
//  Created by 木本瑛介 on 2023/05/27.
//

import Foundation
import Firebase
import SwiftUI
import FirebaseFirestoreSwift

class DataFetchar: ObservableObject {
    @Published var shops: [ShopModel] = [ShopModel]()
    
    private var fireStore: Firestore = Firestore.firestore()
    
    func fetchShopData() {
        fireStore.collection("shops/cafe/cafe").addSnapshotListener { querySnapshot, error in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            guard let documents = querySnapshot?.documents else { return }
            self.shops = documents.compactMap({ queryDocumentSnapshot -> ShopModel? in
                return try? queryDocumentSnapshot.data(as: ShopModel.self)
            })
        }
        
    }
    
}
    

