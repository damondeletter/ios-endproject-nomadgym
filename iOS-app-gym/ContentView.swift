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
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body : some View {
        NavigationView{
            if viewModel.userSession == nil {
                LoginRegisterView()
            } else {
                TabBarView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
