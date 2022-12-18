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
    @State var LoginPicked = true
    
    let buttonColor = Color.hexColour(hexValue: 0x6715f9)
    var body: some View {
        if userIsLoggedIn {
            OverviewView()
        } else {
            ZStack {
                content
                HStack {
                    Button{
                        LoginPicked = true
                    } label: {
                        Text("Login")
                            .foregroundColor(buttonColor)
                        
                        
                        
                    }.offset(x:-70, y: 355)
                    
                    Button{
                        LoginPicked = false
                    } label: {
                        Text("Sign up")
                            .foregroundColor(buttonColor)
                    }.offset(x:70, y: 355)
                }.frame(height: 1)
                
                if(LoginPicked) {
                    Image(systemName:"hand.point.up").offset(x:-100, y: 380)
                } else {
                    Image(systemName:"hand.point.up").offset(x:100, y: 380)
                }
            }.ignoresSafeArea()
        }
        
    }
    var content : some View {
        VStack {
            if !LoginPicked {
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
