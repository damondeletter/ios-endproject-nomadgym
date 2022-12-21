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
    
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        print("DEBUG USER SESSION IS \(self.userSession)")
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    func uploadProfilePicture(_ image : UIImage) {
        guard let uid = userSession?.uid else {return}
        
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid).updateData(["profileImageUrl":profileImageUrl]) 
        }
    }
}
