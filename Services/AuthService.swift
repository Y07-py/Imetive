//
//  AuthService.swift
//  Imetive
//
//  Created by 木本瑛介 on 2023/06/09.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

class AuthService {
    static var storeRoot: Firestore = Firestore.firestore()
    
    static func getUserId(userId: String) -> DocumentReference {
        return storeRoot.collection("users").document(userId)
    }
    
    static func signUp(userName: String, email: String, password: String, imageData: Data, onSuccess: @escaping(_ user: UserModel) -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authData, error in
            
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            
            guard let userId = authData?.user.uid else { return }
            let storageProfileId = StorageService.storageProfileId(userId: userId)
            let metaData = StorageMetadata()
            metaData.contentType = "image/jpg"
            StorageService.saveProdileImage(userId: userId, userName: userName, email: email, imageData: imageData, metaData: metaData, storageProfileImageRef: storageProfileId, onSuccess: onSuccess, onError: onError)
        }
    }
    
    static func signIn(email: String, password: String, onSuccess: @escaping(_ user: UserModel) -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) {
            (authData, error) in
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            guard let userId = authData?.user.uid else { return }
            let firestoreUserId = getUserId(userId: userId)
            firestoreUserId.getDocument { documentSnapshot, error in
                if error != nil {
                    onError(error!.localizedDescription)
                    return
                }
                if let dict = documentSnapshot?.data() {
                    guard let decodedUser = try? UserModel.init(fromDictionary: dict) else { return }
                    onSuccess(decodedUser)
                }
                
            }
        }
    }
}
