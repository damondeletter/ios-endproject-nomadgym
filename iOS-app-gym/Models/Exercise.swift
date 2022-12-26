//
//  Exercise.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 25/12/2022.
//

import Foundation

// MARK: - Exercise
struct Exercise: Codable {
    let id, name, musclegroup, workoutID: String
    let sets: [Set]

    enum CodingKeys: String, CodingKey {
        case id, name, musclegroup
        case workoutID = "workout_id"
        case sets
    }
}

struct ExerciseSwift : Codable {
    var name, musclegroup : String
    var sets : [SetSwift]
}
