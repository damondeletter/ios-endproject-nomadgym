//
//  AuthViewModel.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 21/12/2022.
//

import SwiftUI
import Firebase

class AuthViewModel : ObservableObject {
    @Published var userSession : FirebaseAuth.User?
    private let service = UserService()
    @Published var userInCurrentSession : User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    func uploadProfilePicture(_ image : UIImage) {
        guard let uid = userSession?.uid else {return}
        print("Begonnen in viewmodel")
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid).updateData(["profileImageUrl":profileImageUrl]) 
        }
        print("gelukt in viewmodel")
        fetchUser()
        print("Fetch opnieuw aangeroepen")
    }
    func fetchUser() {
        guard let uid = self.userSession?.uid else {return}
        service.fetchUser(withUid: uid) { user in
            self.userInCurrentSession = user
        }
    }
}
