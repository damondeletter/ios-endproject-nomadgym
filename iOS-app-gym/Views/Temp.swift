//
//  Temp.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 25/12/2022.
//

import SwiftUI

struct Temp: View {
    let buttonColor = Color.hexColour(hexValue: 0x6715f9)
    let backgroundlower = LinearGradient(gradient: Gradient(colors: [.white,Color.hexColour(hexValue: 0xF3F4FA),Color.hexColour(hexValue: 0xbb94fe)]), startPoint: .top, endPoint: .bottom)
    @AppStorage("exerciseAmount") private var exerciseAmount: Int = 0
    @State private var workoutname: String = ""
    @State private var showingPopover = false
    @State private var setAmount: Int = 4
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.zeroSymbol  = ""
        return formatter
    }()
    @AppStorage("Exercises") private var exercises: [ExerciseSwift] = []
    
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
                    HStack {
                       
                        

                        
                        HStack {
                            Text("Amount of exercises")
                            Button(action: {
                                self.exerciseAmount -= 1
                                self.exercises.popLast()
                            }) {
                                Image(systemName: "minus")
                            }
                            Image(systemName: "\(exerciseAmount).circle").frame(width: 50, height: 50).font(.title)
                            Button(action: {
                                self.exerciseAmount += 1
                                self.exercises.append(ExerciseSwift(name: "", musclegroup: "", sets: [SetSwift(reps: 0, weight: 0)]))
                            }) {
                                Image(systemName: "plus")
                            }
                            Spacer()
                        }
                    }
                    
                    ForEach(0..<exerciseAmount, id: \.self) { index in
                        if index < self.exercises.count {
                            self.exerciseView(for: index)
                        }
                    }
                    Button {
                        showingPopover = true
                    } label: {
                        Text("FINISH")
                            .bold()
                            .frame(width: 200, height: 40)
                            .background {
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(buttonColor)
                            }
                            .foregroundColor(.white)
                    }.padding(.vertical, 30)
                        .popover(isPresented: $showingPopover) {
                            ZStack {
                                backgroundlower
                                Path { path in
                                    path.move(to: CGPoint(x: 0, y: 0))
                                    path.addLine(to: CGPoint(x: 0, y: 300))
                                    path.addCurve(to: CGPoint(x: 430, y: 200), control1: CGPoint(x: 175, y: 350), control2: CGPoint(x: 250, y: 80))
                                    path.addLine(to: CGPoint(x: 450, y: 0))
                                }.fill(.white)
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
                                        TextField("duration", value: $workoutname, formatter: numberFormatter).padding().autocorrectionDisabled()
                                    }
                                    Button {
                                        //finish
                                        
                                    } label: {
                                        Text("END WORKOUT")
                                            .bold()
                                            .frame(width: 200, height: 40)
                                            .background {
                                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                                    .fill(buttonColor)
                                            }
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                            .ignoresSafeArea()
                        }
                    Spacer()
                }.padding(.top, 150).padding(.horizontal, 20)
                
            }.ignoresSafeArea()
    }
    
    private func exerciseView(for index: Int) -> some View {
        VStack {
            HStack {
                Text("Exercisename:").bold()
                TextField("Exercise name", text: self.$exercises[index].name)
            }
            HStack {
                Text("Amount of sets:").bold()
                
                TextField("Amount of sets", value: self.$setAmount, formatter: numberFormatter)
            }
            ForEach(0..<self.setAmount, id: \.self) { setIndex in
                if setIndex < self.exercises[index].sets.count {
                    self.setView(for: index, setIndex: setIndex)
                }
            }
        }
    }
    
    private func setView(for index: Int, setIndex: Int) -> some View {
        HStack {
            Text("Set \(index + 1):").bold()
            TextField("Reps", text: Binding<String>(get: {
                String(self.exercises[index].sets[setIndex].reps)
            }, set: {
                if let value = Int($0) {
                    self.exercises[index].sets[setIndex].reps = value
                }
            }))
            TextField("Weight", text: Binding<String>(get: {
                String(self.exercises[index].sets[setIndex].weight)
            }, set: {
                if let value = Int($0) {
                    self.exercises[index].sets[setIndex].weight = value
                }
            }))
        }
    }
}


struct Temp_Previews: PreviewProvider {
    static var previews: some View {
        Temp()
    }
}
