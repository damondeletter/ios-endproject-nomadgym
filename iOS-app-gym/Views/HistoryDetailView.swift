//
//  HistoryDetailView.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 24/12/2022.
//

import SwiftUI

struct HistoryDetailView: View {
    let workout : Workout
    let backgroundlower = LinearGradient(gradient: Gradient(colors: [.white,Color.hexColour(hexValue: 0xF3F4FA),Color.hexColour(hexValue: 0xbb94fe)]), startPoint: .top, endPoint: .bottom)
    var body: some View {
        ZStack {
            backgroundlower
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: 0, y: 300))
                path.addCurve(to: CGPoint(x: 430, y: 200), control1: CGPoint(x: 175, y: 350), control2: CGPoint(x: 250, y: 80))
                path.addLine(to: CGPoint(x: 450, y: 0))
            }.fill(.white)
            VStack {
                HStack(alignment: .center) {
                    Text(workout.name).font(.title)
                }
                HStack {
                    Text(workout.workoutdate.prefix(10)).font(.subheadline)
                }
                VStack {
                    ForEach(workout.exercises, id: \.id) { exercise in
                        VStack{
                            Text(exercise.name).bold()
                            
                            Text("Muscle group trained: \(exercise.musclegroup.uppercased())")
                            
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
                Spacer()
            }
        }
    }
}

