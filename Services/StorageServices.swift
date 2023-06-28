//
//  AuthServices.swift
//  Imetive
//
//  Created by 木本瑛介 on 2023/06/09.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseStorage

class StorageService {
    static var storage: Storage = Storage.storage()
    static var storageRoot: StorageReference = storage.reference(forURL: "gs://restaurantdatabase-91d1e.appspot.com")
    static var storageProfile: StorageReference = storageRoot.child("profile")
    
    static func storageProfileId(userId: String) -> StorageReference {
        return storageProfile.child(userId)
    }
    
    static func saveProdileImage(userId: String, userName: String, email: String, imageData: Data, metaData: StorageMetadata, storageProfileImageRef: StorageReference, onSuccess: @escaping(_ user: UserModel) -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        
        storageProfileImageRef.putData(imageData, metadata: metaData) { (storageMetaData, error) in
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            storageProfileImageRef.downloadURL { (url, error) in
                if error != nil {
                    onError(error!.localizedDescription)
                    return
                }
                if let metaImageUrl = url?.absoluteString {
                    if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest() {
                        changeRequest.displayName = userName
                        changeRequest.commitChanges { (error) in
                            if error != nil {
                                onError(error!.localizedDescription)
                                return
                            }
                        }
                    }
                    let firestoreUserId = AuthService.getUserId(userId: userId)
                    let user = UserModel(uid: userId, userName: userName, email: email, profileImageUrl: metaImageUrl, searchName: userName.splitString(), bio: "")
                    guard let dict = try? user.asDictionary() else { return }
                    firestoreUserId.setData(dict) {
                        (error) in
                        if error != nil {
                            onError(error!.localizedDescription)
                            return
                        }
                    }
                    onSuccess(user)
                }
            }
            
        }
    }
    
}
