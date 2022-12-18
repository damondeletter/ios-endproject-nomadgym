//
//  LoginRegisterView.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 18/12/2022.
//

import SwiftUI
import Firebase

struct LoginRegisterView: View {
    
    @State private var userIsLoggedIn = false
    @State var LoginPicked = false
    
    var body: some View {
        if userIsLoggedIn {
            OverviewView()
        } else {
            ZStack {
                content
                HStack {
                    Button{
                    } label: {
                        Text("Login")
                    }.offset(x:-70, y: 370)
                    
                    Button{
                        
                    } label: {
                        Text("Sign up")
                    }.offset(x:70, y: 370)
                }.frame(height: 1)
            }.ignoresSafeArea()
            
        }
    }
    var content : some View {
        VStack {
            if LoginPicked {
                RegisterView()
            } else {
                LoginView()
            }
        }
    }
    
}

struct LoginRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        LoginRegisterView()
    }
}
