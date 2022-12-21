//
//  OverviewView.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 18/12/2022.
//

import SwiftUI
import Firebase

struct OverviewView: View {
    @State private var userIsLoggedOut = false
    @EnvironmentObject var viewModel : AuthViewModel
    @State private var nextScene = false
    let backgroundlower = LinearGradient(gradient: Gradient(colors: [.white,Color.hexColour(hexValue: 0xF3F4FA),Color.hexColour(hexValue: 0xbb94fe)]), startPoint: .top, endPoint: .bottom)
    var body: some View {
        
        if nextScene {
            //TabBarView()
            UserView()
        } else {
            ZStack {
                backgroundlower
                Path { path in
                    path.move(to: CGPoint(x: 0, y: 0))
                    path.addLine(to: CGPoint(x: 0, y: 300))
                    path.addCurve(to: CGPoint(x: 430, y: 200), control1: CGPoint(x: 175, y: 350), control2: CGPoint(x: 250, y: 80))
                    path.addLine(to: CGPoint(x: 450, y: 0))
                }.fill(.white)
                
                
                VStack {
                    Text("INGELOGD")
                    
                    
                    Button {
                        viewModel.signOut()
                        userIsLoggedOut = true
                    }label: {
                        Text("Test")
                    }
                    
                    Button {
                        nextScene = true
                    } label: {
                        Text("temp")
                    }
                    
                }
                .fullScreenCover(isPresented: $userIsLoggedOut, onDismiss: nil) {
                    LoginRegisterView()
                }
            }.ignoresSafeArea() }
        
    }

}

struct OverviewView_Previews: PreviewProvider {
    
    static var previews: some View {
        OverviewView()
    }
}
