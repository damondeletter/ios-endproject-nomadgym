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

