//
//  ViewModel.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 22/12/2022.
//

import SwiftUI



class ViewModel : ObservableObject {
    @Published var items = [InfoBlock]()
    @Published var workouts = [Workout]()

    
    func fetchData() async {
        guard let url = URL(string: "http://localhost:9000/api/infoblocks") else {
            
            return
        }
        
        do {
            
            let(data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode([InfoBlock].self, from: data) {
                items = decodedResponse
                
            }
        } catch {
            print("OOPS FOUTJE")
        }
    }
    
    func fetchWorkouts(_ userId : String) async {
        guard let url = URL(string: "http://localhost:9000/api/workouts/\(userId)") else {
            
            return
        }
        
        do {
            
            let(data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode([Workout].self, from: data) {
                workouts = decodedResponse
                print(workouts)
            }
        } catch {
            print("OOPS FOUTJE")
        }
    }
}

