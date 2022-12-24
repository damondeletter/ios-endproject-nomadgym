import Foundation

// MARK: - Workout
struct Workout: Codable {
    let id, name: String
    let totalTime, hasStarted: Int
    let workoutdate, userUid: String
    let exercises: [Exercise]

    enum CodingKeys: String, CodingKey {
        case id, name
        case totalTime = "total_time"
        case hasStarted, workoutdate
        case userUid = "user_uid"
        case exercises
    }
}

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
