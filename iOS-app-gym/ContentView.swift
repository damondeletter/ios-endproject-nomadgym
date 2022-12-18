//
//  ContentView.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 18/12/2022.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @State private var UserIsCurrentyLoggedOut : Bool = false
    
    var body : some View {
        NavigationView{
            if self.UserIsCurrentyLoggedOut {
                OverviewView()
            } else {
                LoginRegisterView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
