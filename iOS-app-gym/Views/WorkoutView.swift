//
//  WorkoutView.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 21/12/2022.
//

import SwiftUI

struct WorkoutView: View {
    @State var show = false
    
    var body: some View {
        ZStack {
            Constants.backgroundlower
            PathComp()
         
                VStack {
                    Spacer()
                    VStack {
                        Text("Press the start button to begin a new workout!")
                            .bold().multilineTextAlignment(TextAlignment.center)
                        Text("WATCH OUT: the workout will only be saved when u press FINISH").multilineTextAlignment(TextAlignment.center)
                            .font(.caption)
                    }.frame(width: 200)
                    Button {
                        show = true
                        
                    } label: {
                        Text("Start")
                            .bold()
                            .frame(width: 200, height: 40)
                            .background {
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(Constants.buttonColor)
                            }
                            .foregroundColor(.white)
                    }
                    .padding(.top)
                    .offset(y: 100)
                    .sheet(isPresented: $show) {
                        WorkoutDialogView()
                    }
                    Spacer()
                    Spacer()
                }
            }
        .ignoresSafeArea()
        
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}
