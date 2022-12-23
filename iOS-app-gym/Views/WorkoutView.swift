//
//  WorkoutView.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 21/12/2022.
//

import SwiftUI

struct WorkoutView: View {
    let backgroundlower = LinearGradient(gradient: Gradient(colors: [.white,Color.hexColour(hexValue: 0xF3F4FA),Color.hexColour(hexValue: 0xbb94fe)]), startPoint: .top, endPoint: .bottom)
    @State var show = false
    let buttonColor = Color.hexColour(hexValue: 0x6715f9)
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
                                    .fill(buttonColor)
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
