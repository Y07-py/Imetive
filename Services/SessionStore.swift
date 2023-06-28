//
//  SessionStore.swift
//  Imetive
//
//  Created by 木本瑛介 on 2023/06/10.
//

import Foundation
import Combine
import Firebase
import FirebaseAuth

class SessionStore: ObservableObject {
    var didChanege = PassthroughSubject<SessionStore, Never>()
    @Published var session: UserModel? {
        didSet {
            self.didChanege.send(self)
        }
    }
    @Published var showingProgressView: Bool = true
    var handler: AuthStateDidChangeListenerHandle?
    
    func listen() {
        handler = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if let user = user {
                let firestoreUserId = AuthService.getUserId(userId: user.uid)
                firestoreUserId.getDocument { documentSnapshot, error in
                    if error != nil {
                        print(error!.localizedDescription)
                        return
                    }
                    if let dict = documentSnapshot?.data() {
                        guard let decodedUser = try? UserModel.init(fromDictionary: dict) else { return }
                        self.session = decodedUser
                        self.showingProgressView = false
                    }
                }
            } else {
                self.session = nil
                self.showingProgressView = false
            }
        })
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            
        }
    }
    
    func unbind() {
        if let handler = handler {
            Auth.auth().removeStateDidChangeListener(handler)
        }
    }
    
    deinit {
        unbind()
    }
}
