//
//  HistoryView.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 22/12/2022.
//

import SwiftUI
import Firebase

struct HistoryView: View {
    let backgroundlower = LinearGradient(gradient: Gradient(colors: [.white,Color.hexColour(hexValue: 0xF3F4FA),Color.hexColour(hexValue: 0xbb94fe)]), startPoint: .top, endPoint: .bottom)
    @State private var workouts = [Workout]()
    @ObservedObject var viewModel = ViewModel()
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
                Button {
                   print(Auth.auth().currentUser!.uid)
                } label : {
                    ForEach(workouts, id: \.id) { workout in
                        NavigationLink(destination: HistoryDetailView(workout: workout)) {
                            HStack {
                                Text(workout.name)
                                Spacer()
                                Text(workout.workoutdate.prefix(10))
                                
                            }
                            .padding()
                            .listRowBackground(Color.hexColour(hexValue: 0x77BAFE))
                        }
                    }
                }
                Spacer()
            }.task {
                await viewModel.fetchWorkouts(Auth.auth().currentUser!.uid)
                workouts = viewModel.workouts
                
                
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
