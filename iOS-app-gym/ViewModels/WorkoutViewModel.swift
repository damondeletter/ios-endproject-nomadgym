//
//  WorkoutViewModel.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 25/12/2022.
//

import Foundation

class WorkoutViewModel : ObservableObject {
    @Published var title: String = ""
      @Published var warmUp: String = ""
      @Published var coolDown: String = ""

      @Published private var exercises = [ExerciseSwift]()
      @Published var exerciseViewModels = [ExerciseViewModel]()
      
    private var cancellables = Set()
      
      init(exercises: [ExerciseSwift]) {
        $exercises.map { exercises in
          exercises.map { exercise in
            ExerciseViewModel(id: exercise.id, title: exercise.title, details: exercise.details)
          }
        }
        .assign(to: \.exerciseViewModels, on: self)
        .store(in: &cancellables)
        
        self.exercises = exercises
      }
      
      func addNewExercise() {
          exercises.append(ExerciseSwift(name: "", musclegroup: "", sets: <#[SetSwift]#>))
      }
    }
}
