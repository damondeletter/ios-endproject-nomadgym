//
//  WorkoutExerciseViewModel.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 25/12/2022.
//

import Foundation

class WorkoutExerciseViewModel : ObservableObject {
    
    func postWorkout(name: String, totalTime: Int, hasStarted: Int, workoutDate: String, userUid: String, exercises: [ExerciseSwift]) {
        let url = URL(string: "http://localhost:9000/api/workouts/")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let workout = WorkoutSwift(name: name, totalTime: totalTime, hasStarted: hasStarted, workoutdate: workoutDate, userUid: userUid, exercises: exercises)

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONEncoder().encode(workout)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
                return
            }

            if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                print("Error: status code \(response.statusCode)")
                return
            }

            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                
            }
        }.resume()
    }
}
