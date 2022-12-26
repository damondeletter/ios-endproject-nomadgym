//
//  WorkoutDialogView.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 23/12/2022.
//

import SwiftUI


//the worst way to implement this, but due to a lack of time and a lot of errors when trying to implement it dynamically (array, appstore, automaticly create variables,..), i decided to do it hardcoded
    

struct WorkoutDialogView: View {
    let buttonColor = Color.hexColour(hexValue: 0x6715f9)
    let backgroundlower = LinearGradient(gradient: Gradient(colors: [.white,Color.hexColour(hexValue: 0xF3F4FA),Color.hexColour(hexValue: 0xbb94fe)]), startPoint: .top, endPoint: .bottom)
    @AppStorage("exerciseAmount") var exerciseAmount : Int = 0
    @AppStorage("workoutName") var workoutname : String = ""
    @State private var showingPopover = false
    @AppStorage("setAmount") var setAmount : Int = 4
    //not a good performance but it works for now
    @AppStorage("exercisename1") var exerciseName1 : String = ""
    @AppStorage("exercisename1set1Reps") var exercise1setj1Reps : Int = 0
    @AppStorage("exercisename1set1Weight") var exercise1setj1Weight : Int = 0
    @AppStorage("exercisename1set2Reps") var exercise1setj2Reps : Int = 0
    @AppStorage("exercisename1set2Weight") var exercise1setj2Weight : Int = 0
    @AppStorage("exercisename1set3Reps") var exercise1setj3Reps : Int = 0
    @AppStorage("exercisename1set3Weight") var exercise1setj3Weight : Int = 0
    @AppStorage("exercisename1set4Reps") var exercise1setj4Reps : Int = 0
    @AppStorage("exercisename1set4Weight") var exercise1setj4Weight : Int = 0

    @AppStorage("exercisename2") var exerciseName2 : String = ""
    @AppStorage("exercisename2set1Reps") var exercise2setj1Reps : Int = 0
    @AppStorage("exercisename2set1Weight") var exercise2setj1Weight : Int = 0
    @AppStorage("exercisename2set2Reps") var exercise2setj2Reps : Int = 0
    @AppStorage("exercisename2set2Weight") var exercise2setj2Weight : Int = 0
    @AppStorage("exercisename2set3Reps") var exercise2setj3Reps : Int = 0
    @AppStorage("exercisename2set3Weight") var exercise2setj3Weight : Int = 0
    @AppStorage("exercisename2set4Reps") var exercise2setj4Reps : Int = 0
    @AppStorage("exercisename2set4Weight") var exercise2setj4Weight : Int = 0
    
    @AppStorage("exercisename3") var exerciseName3 : String = ""
    @AppStorage("exercisename3set1Reps") var exercise3setj1Reps : Int = 0
    @AppStorage("exercisename3set1Weight") var exercise3setj1Weight : Int = 0
    @AppStorage("exercisename3set2Reps") var exercise3setj2Reps : Int = 0
    @AppStorage("exercisename3set2Weight") var exercise3setj2Weight : Int = 0
    @AppStorage("exercisename3set3Reps") var exercise3setj3Reps : Int = 0
    @AppStorage("exercisename3set3Weight") var exercise3setj3Weight : Int = 0
    @AppStorage("exercisename3set4Reps") var exercise3setj4Reps : Int = 0
    @AppStorage("exercisename3set4Weight") var exercise3setj4Weight : Int = 0

    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.zeroSymbol  = ""
        return formatter
    }()
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
                ScrollView {
                    VStack {
                        HStack {
                            Text("Amount of exercises")
                            Button(action: {
                                if self.exerciseAmount > 0 {
                                    self.exerciseAmount -= 1
                                }
                            }) {
                                Image(systemName: "minus")
                            }
                            Image(systemName: "\(exerciseAmount).circle").frame(width: 50, height: 50).font(.title)
                            Button(action: {
                                if self.exerciseAmount < 3 {
                                    self.exerciseAmount += 1
                                }
                            }) {
                                Image(systemName: "plus")
                            }
                            Spacer()
                        }
                        if (self.exerciseAmount >= 1) {
                            TextField("Exercise 1", text: $exerciseName1).autocorrectionDisabled()
                            Grid() {
                                GridRow {
                                    Text("Set 1:")
                                    TextField("reps", value: $exercise1setj1Reps,  formatter: numberFormatter)
                                    TextField("weight", value: $exercise1setj1Weight,formatter: numberFormatter)

                                }
                                GridRow {
                                    Text("Set 2:")
                                    TextField("reps", value: $exercise1setj2Reps,  formatter: numberFormatter)
                                    TextField("weight", value: $exercise1setj2Weight,formatter: numberFormatter)

                                }
                                GridRow {
                                    Text("Set 3:")
                                    TextField("reps", value: $exercise1setj3Reps,  formatter: numberFormatter)
                                    TextField("weight", value: $exercise1setj3Weight,formatter: numberFormatter)

                                }
                                GridRow {
                                    Text("Set 4:")
                                    TextField("reps", value: $exercise1setj4Reps,  formatter: numberFormatter)
                                    TextField("weight", value: $exercise1setj4Weight,formatter: numberFormatter)

                                }
                            }
                            if (self.exerciseAmount > 1) {
                                TextField("Exercise 2", text: $exerciseName2).autocorrectionDisabled()
                                Grid() {
                                    GridRow {
                                        Text("Set 1:")
                                        TextField("reps", value: $exercise2setj1Reps,  formatter: numberFormatter)
                                        TextField("weight", value: $exercise2setj1Weight,formatter: numberFormatter)
                                        
                                    }
                                    GridRow {
                                        Text("Set 2:")
                                        TextField("reps", value: $exercise2setj2Reps,  formatter: numberFormatter)
                                        TextField("weight", value: $exercise2setj2Weight,formatter: numberFormatter)
                                        
                                    }
                                    GridRow {
                                        Text("Set 3:")
                                        TextField("reps", value: $exercise2setj3Reps,  formatter: numberFormatter)
                                        TextField("weight", value: $exercise2setj3Weight, formatter: numberFormatter)
                                        
                                    }
                                    GridRow {
                                        Text("Set 4:")
                                        TextField("reps", value: $exercise2setj4Reps,  formatter: numberFormatter)
                                        TextField("weight", value: $exercise2setj4Weight,formatter: numberFormatter)
                                        
                                    }
                                }
                                }
                            if (self.exerciseAmount > 2) {
                                TextField("Exercise 3", text: $exerciseName3).autocorrectionDisabled()
                                Grid() {
                                    GridRow {
                                        Text("Set 1:")
                                        TextField("reps", value: $exercise3setj1Reps,  formatter: numberFormatter)
                                        TextField("weight", value: $exercise3setj1Weight,formatter: numberFormatter)
                                        
                                    }
                                    GridRow {
                                        Text("Set 2:")
                                        TextField("reps", value: $exercise3setj2Reps,  formatter: numberFormatter)
                                        TextField("weight", value: $exercise3setj2Weight,formatter: numberFormatter)
                                        
                                    }
                                    GridRow {
                                        Text("Set 3:")
                                        TextField("reps", value: $exercise3setj3Reps,  formatter: numberFormatter)
                                        TextField("weight", value: $exercise3setj3Weight,formatter: numberFormatter)
                                        
                                    }
                                    GridRow {
                                        Text("Set 4:")
                                        TextField("reps", value: $exercise3setj4Reps,  formatter: numberFormatter)
                                        TextField("weight",  value:$exercise3setj4Weight,formatter: numberFormatter)
                                        
                                    }
                                }
                                }
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
                }.padding(.top, 150).padding(.horizontal, 20)
                
            }
        }
        
        .ignoresSafeArea()
    }
}

struct WorkoutDialogView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDialogView()
    }
}
