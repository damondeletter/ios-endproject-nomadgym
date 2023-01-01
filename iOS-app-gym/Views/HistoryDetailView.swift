//
//  HistoryDetailView.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 24/12/2022.
//

import SwiftUI

struct HistoryDetailView: View {
    let workout : Workout
   
    var body: some View {
        ZStack {
            Constants.backgroundlower
            Path()
            ScrollView {
                
                VStack {
                    HStack(alignment: .center) {
                        Text(workout.name).font(.title)
                    }
                    HStack {
                        Text(workout.workoutdate.prefix(10)).font(.subheadline)
                    }
                    VStack {
                        ForEach(workout.exercises, id: \.id) { exercise in
                            if(exercise.name != "" || exercise.musclegroup != "") {
                                VStack{
                                    Text(exercise.name).font(.title2).bold()
                                    
                                    Text(exercise.musclegroup.uppercased())
                                    
                                }.padding()
                                VStack {
                                    HStack {
                                        Text("Sets:").font(.title2).bold()
                                        Spacer()
                                    }.padding(.horizontal)
                                    
                                    HStack {
                                        VStack(alignment: .leading) {
                                            ForEach(Array(exercise.sets.enumerated()), id: \.element) { index,setje in
                                                VStack(alignment: .leading) {
                                                    Text("Set \(index + 1):").bold()
                                                    Text("\(setje.reps) x \(setje.weight) kg")
                                                }
                                            }
                                        }
                                        Spacer()
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                    Spacer()
                }.padding(.top, 50)
            }
        }
    }
}

