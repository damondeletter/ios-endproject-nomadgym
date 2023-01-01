//
//  HistoryView.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 22/12/2022.
//

import SwiftUI
import Firebase

struct HistoryView: View {
 
    @State private var selectedTab : Tab = .arrow
    @State private var workouts = [Workout]()
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Constants.backgroundlower
            PathComp()
            ScrollView {
            VStack {
             
                HStack {
                    Text("Last 7 workouts:").font(.title2).bold()
                    Spacer()
                }
                .padding()
                ForEach(workouts.suffix(7), id: \.id) { workout in
                            NavigationLink(destination: HistoryDetailView(workout: workout)) {
                                HStack {
                                    Text(workout.name)
                                    Spacer()
                                    Text(workout.workoutdate.prefix(10))
                                    Image(systemName: "arrow.right")
                                    
                                }
                                .padding()
                                .listRowBackground(Color.hexColour(hexValue: 0x77BAFE))
            
                            }
                }
                        .foregroundColor(.gray)
                
                if(workouts.count > 7) {
                    HStack {
                        Text("Older workouts:").font(.title2).bold()
                        Spacer()
                    }
                    ForEach(workouts.prefix(workouts.count - 7), id: \.id) { workout in
                        NavigationLink(destination: HistoryDetailView(workout: workout)) {
                            HStack {
                                Text(workout.name)
                                Spacer()
                                Text(workout.workoutdate.prefix(10))
                                Image(systemName: "arrow.right")
                            }
                            .padding()
                            .listRowBackground(Color.hexColour(hexValue: 0x77BAFE))
                            
                        }
                    }
                    .foregroundColor(.gray)
                }
                
                Spacer()
            }.task {
                await viewModel.fetchWorkouts(Auth.auth().currentUser!.uid)
                workouts = viewModel.workouts.sorted(by: {$0.workoutdate > $1.workoutdate})
            }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
