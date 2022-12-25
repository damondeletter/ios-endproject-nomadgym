//
//  Set.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 25/12/2022.
//

import Foundation
// MARK: - Set
struct Set: Codable, Hashable {
    let id: String
    let reps, weight: Int
    let exerciseID: String

    enum CodingKeys: String, CodingKey {
        case id, reps, weight
        case exerciseID = "exercise_id"
    }
}

struct SetSwift : Codable {
    let reps, weight : Int
}
