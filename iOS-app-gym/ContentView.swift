//
//  ContentView.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 18/12/2022.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @State private var UserIsCurrentlyLoggedOut : Bool = false
    
    var body : some View {
        NavigationView{
            if Auth.auth().currentUser?.uid == nil {
            //if !self.UserIsCurrentlyLoggedOut {
                LoginRegisterView()
            } else {
                OverviewView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
