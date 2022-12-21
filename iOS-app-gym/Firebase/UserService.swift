//
//  UserService.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 21/12/2022.
//

import Firebase
import FirebaseFirestoreSwift

struct UserService {
    func fetchUser(withUid uid : String, completion: @escaping(User) -> Void) {
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
            guard let snapshot = snapshot else {return}
            guard let user = try? snapshot.data(as: User.self) else { return }
            completion(user)
            print("DEBUG: firstname is \(user.fname)")
            print("DEBUG: lastname is \(user.lname)")
            print("DEBUG: email is \(user.email)")
        }
        
    }
}
