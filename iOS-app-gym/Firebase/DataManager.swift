//
//  DataManager.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 21/12/2022.
//

import SwiftUI
import Firebase

class DataManager : ObservableObject {
    
    func getUserName() -> String {
        var userName = ""
        guard let uid = Auth.auth().currentUser?.uid else { return "" }
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, error in
            if error != nil {
                print("error: ======")
                print(error?.localizedDescription ?? "Error can't be read")
                print("=======")
            } else {
                print(snapshot?.value(forKey: "fname") ?? "Error can't be read")
                userName = snapshot?.get("fname") as! String
            }
        }
        
        return userName
    }
    
    
    
    
}
