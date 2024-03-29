//
//  LoginView.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 18/12/2022.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State var text : String = ""
    let welcomeText : String = "Welcome to nomadgym"
    @State private var selectedTab : Tab = .house
    @State private var writing = false
    @State private var movingCursor = false
    @State private var blinkingCursor = false
    @State private var userIsLoggedIn = false
    @State private var alert = false
    @State private var error = ""
    @FocusState private var focusedField : Bool
    
    var body: some View {
        ZStack {
            Constants.backgroundlower
           Path()
            .onAppear {
                // Writing Animation
                withAnimation(.easeOut(duration: 2).delay(1).repeatForever(autoreverses: true)) {
                    writing.toggle()
                    movingCursor.toggle()
                }
                // Cursor Blinking Animation
                withAnimation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true)) {
                    
                    blinkingCursor.toggle()
                }
            }
            VStack(spacing: 20) {
                Text("Welcome back").offset(y:-175)
                    .font(.system(size: 40, weight: .bold,design: .rounded))
                    .foregroundColor(Constants.buttonColor)
                ZStack(alignment: .leading) {
                    Text("Continue the grind")
                    
                        .font(.system(size: 17, weight: .bold,design: .rounded))
                        .mask(Rectangle().offset(x: writing ? 0 : -150))
                        .offset(y:-185)
                        .foregroundColor(Constants.buttonColor)
                    
                    Rectangle()
                        .fill(.black)
                        .opacity(blinkingCursor ? 0 : 1)
                        .frame(width: 2, height: 24)
                        .offset(x: movingCursor ? 148 : 0)
                        .offset(y:-185)
                }
                HStack{
                    TextField("",text: $email)
                        .textFieldStyle(.plain)
                        .autocorrectionDisabled()
                        .focused($focusedField)
                        .keyboardShortcut(.tab)                        .placeholder(when: email.isEmpty) {
                            Text("Email")
                                .bold()
                                .foregroundColor(Constants.buttonColor)
                        }
                    Image(systemName: "envelope")
                }
                
                Rectangle()
                    .frame(width: 350, height: 1)
                
                HStack{
                    SecureField("", text: $password)
                        .autocorrectionDisabled()
                        .textFieldStyle(.plain)
                        .keyboardShortcut(.tab)
                        .placeholder(when: password.isEmpty) {
                            Text("Password").bold()
                                .foregroundColor(Constants.buttonColor)
                        }
                    Image(systemName: "lock")
                }
                
                Rectangle()
                    .frame(width: 350, height: 1)
                
                Button {
                    login()
                    
                } label: {
                    Text("Log in")
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
                .alert(error, isPresented: $alert, actions: {})
                .keyboardShortcut(.defaultAction).keyboardShortcut(.tab).onSubmit {
                    login()
                    selectedTab = .house
                }
            }
            .frame(width: 350)
            .onAppear {
                Auth.auth().addStateDidChangeListener { auth, user in
                    if user != nil {
                        userIsLoggedIn.toggle()
                    }
                }
            }
            Spacer()
        }.ignoresSafeArea()
            .fullScreenCover(isPresented: $userIsLoggedIn, onDismiss: nil) {
                TabBarView()
            }
            .onAppear {
                focusedField = true
            }
    }
    
    func login () {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            
            if error != nil {
               
                print(error!.localizedDescription)
                if error!.localizedDescription == "There is no user record corresponding to this identifier. The user may have been deleted." {
                    self.error = Constants.errormessages["user-not-found"]!
                } else if(error!.localizedDescription == "A network error (such as timeout, interrupted connection or unreachable host) has occurred."){
                    self.error = Constants.errormessages["network-request-failed"]!
                    
                } else if(error!.localizedDescription == "The password is invalid or the user does not have a password.") {
                    self.error = Constants.errormessages["auth/wrong-password"]!
                }
                else {
                    self.error = error!.localizedDescription
                }
                
                self.alert = true
                if(email.isEmpty) {
                    focusedField = true
                }
            } else {
                userIsLoggedIn = true
            }
        }

    }

    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


// typewriter effect: https://betterprogramming.pub/typewriter-effect-in-swiftui-ba81db10b570
