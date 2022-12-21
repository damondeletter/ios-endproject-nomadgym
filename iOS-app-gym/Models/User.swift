//
//  User.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 21/12/2022.
//

import FirebaseFirestoreSwift

struct User : Identifiable, Decodable {
    @DocumentID var id: String?
    let email : String
    let fname : String
    let profileImageUrl : String
    let lname: String
    
    
}
