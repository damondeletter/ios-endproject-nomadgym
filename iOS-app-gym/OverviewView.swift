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
    var body: some View {
        VStack {
            Text("INGELOGD")
            
            
            Button {
               logout()
            }label: {
                Text("Test")
            }
        }
        .fullScreenCover(isPresented: $userIsLoggedOut, onDismiss: nil) {
            LoginRegisterView()
        }
        
    }
    func logout() {
        try? Auth.auth().signOut()
        userIsLoggedOut = true
        
    }
}

struct OverviewView_Previews: PreviewProvider {
    
    static var previews: some View {
        OverviewView()
    }
}
