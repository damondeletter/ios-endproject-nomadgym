//
//  Temp.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 25/12/2022.
//

import SwiftUI
import Firebase

struct WorkoutDialogView: View {
    @AppStorage("exerciseAmount") private var exerciseAmount: Int = 0
    @AppStorage("workoutName") private var workoutname: String = ""
    @AppStorage("workoutDuration") private var workoutDuration : Int = 0
    @State private var showingPopover = false
    @State private var setAmount: Int = 4
    var muscles = ["Choose a muscle", "Chest", "Shoulders", "Rear delts", "Biceps", "Triceps", "Glutes", "Quads", "Hamstrings", "Calves", "Abs", "Back","Forearms"]
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.zeroSymbol  = ""
        return formatter
    }()
    
    @ObservedObject var workoutviewModel = WorkoutExerciseViewModel()
    @ObservedObject var authviewModel = AuthViewModel()
    @AppStorage("Exercises") private var exercises: [ExerciseSwift] = []
    
    var body: some View {
            ZStack {
                Constants.backgroundlower
                Path()
                ScrollView {
                    VStack {
                        HStack {
                            HStack {
                                Text("Amount of exercises")
                                Button(action: {
                                    if(self.exerciseAmount > 0 && self.exerciseAmount <= self.exercises.count) {
                                            self.exercises.removeLast()
                                            self.exerciseAmount -= 1
                                        }
                                }) {
                                    Image(systemName: "minus")
                                }
                                Image(systemName: "\(exerciseAmount).circle").frame(width: 50, height: 50).font(.title)
                                Button(action: {
                                    self.exerciseAmount += 1
                                    self.exercises.append(ExerciseSwift(name: "", musclegroup: "", sets: [SetSwift(reps: 0, weight: 0),SetSwift(reps: 0, weight: 0),SetSwift(reps: 0, weight: 0),SetSwift(reps: 0, weight: 0)]))
                                }) {
                                    Image(systemName: "plus")
                                }
                                Spacer()
                            }
                        }
                        if(exerciseAmount > 0) {
                            ForEach(0..<exerciseAmount, id: \.self) { index in
                                if index < self.exercises.count {
                                    self.exerciseView(for: index).padding(.vertical, 20)
                                }
                                Divider()
                            }
                        
                        Button {
                            showingPopover = true
                            
                        } label: {
                            Text("FINISH")
                                .bold()
                                .frame(width: 200, height: 40)
                                .background {
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(Constants.buttonColor)
                                }
                                .foregroundColor(.white)
                        }.padding(.vertical, 30)
                            .popover(isPresented: $showingPopover) {
                                ZStack {
                                    Constants.backgroundlower
                                    Path()
                                    VStack {
                                        Text("Admire your workout in the future:")
                                            .font(.headline)
                                        Text("All I need from you is the following..")
                                            .font(.subheadline)
                                        HStack {
                                            Text("Workout name:").padding().bold()
                                            TextField("name", text: $workoutname).padding().autocorrectionDisabled()
                                        }
                                        HStack {
                                            Text("Workout length:").padding().bold()
                                            TextField("duration", value: $workoutDuration, formatter: numberFormatter).padding().autocorrectionDisabled()
                                        }
                                        
                                            Button {
                                                //finish
                                                finishWorkout()
                                            } label: {
                                                Text("END WORKOUT")
                                                    .bold()
                                                    .frame(width: 200, height: 40)
                                                    .background {
                                                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                                                            .fill(Constants.buttonColor)
                                                    }
                                                    .foregroundColor(.white)
                                            }
                                        
                                    }
                                }
                                .ignoresSafeArea()
                            }
                        Spacer()
                        }
                    }.padding(.top, 150).padding(.horizontal, 20)
                }
                .onAppear(perform: {
                    exerciseAmount = 0
                })
                
            }.ignoresSafeArea()
            
    }

    private func finishWorkout() {
        workoutviewModel.postWorkout(name: workoutname, totalTime: workoutDuration, hasStarted: 1, workoutDate: getCurrentDate(), userUid: Auth.auth().currentUser!.uid, exercises: exercises)
        
        exerciseAmount = 0
        
        
        workoutname = ""
        workoutDuration = 0
        
    }
    private func getCurrentDate() -> String {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        return format.string(from: date)
    }
    
    private func exerciseView(for index: Int) -> some View {
        
        VStack {
            HStack {
                Text("Exercisename:").bold()
                TextField("Exercise name", text: self.$exercises[index].name).autocorrectionDisabled()
                
            }
            HStack {
                Text("Musclegroup").bold()
                Picker("Muscle:", selection: self.$exercises[index].musclegroup) {
                    ForEach(muscles, id: \.self) {
                        Text($0)
                    }
                }.frame(width: 200)
                Spacer()
            }
            ForEach(0...4, id: \.self) { setIndex in
                if setIndex < self.exercises[index].sets.count {
                    self.setView(for: index, setIndex: setIndex)
                }
            }
        }
    }
    
    private func setView(for index: Int, setIndex: Int) -> some View {
        
        HStack {
            Text("Set \(setIndex + 1):").bold()
            TextField("Reps", text: Binding<String>(get: {
                String(self.exercises[index].sets[setIndex].reps)
            }, set: {
                if let value = Int($0) {
                    self.exercises[index].sets[setIndex].reps = value
                }
            }))
        
            
            HStack {
                TextField("Weight", text: Binding<String>(get: {
                    String(self.exercises[index].sets[setIndex].weight)
                }, set: {
                    if let value = Int($0) {
                        self.exercises[index].sets[setIndex].weight = value
                    }
                }))
                Text("kg").padding(.trailing, 50)
            }
        }
    }
}


struct WorkoutDialogView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDialogView()
    }
}
