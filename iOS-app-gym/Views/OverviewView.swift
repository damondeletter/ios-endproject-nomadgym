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
    var body: some View {
        
        if nextScene {
            //TabBarView()
            UserView()
        } else {
            
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
        }
    }

}

struct OverviewView_Previews: PreviewProvider {
    
    static var previews: some View {
        OverviewView()
    }
}
