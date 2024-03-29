//
//  RegisterView.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 18/12/2022.
//

import SwiftUI
import Firebase

struct RegisterView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State var text : String = ""
    let welcomeText : String = "Welcome to nomadgym"
    @EnvironmentObject private var authViewModel : AuthViewModel
    @State private var alert = false
    @State private var error = ""
    @State private var writing = false
    @State private var movingCursor = false
    @State private var blinkingCursor = false
    @State private var userIsLoggedIn = false
    var body: some View {
        if self.alert {
            //todo fix alert
        }
        ZStack {
            Constants.backgroundlower
            PathComp()
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
                Text("Welcome").offset(y:-175)
                    .font(.system(size: 40, weight: .bold,design: .rounded))
                    .foregroundColor(Constants.buttonColor)
                ZStack(alignment: .leading) {
                    Text("Join our team now")
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
                        .placeholder(when: email.isEmpty) {
                            Text("Email")
                                .bold()
                                .foregroundColor(Constants.buttonColor)
                        }
                    Image(systemName: "envelope")
                }
                
                Rectangle()
                    .frame(width: 350, height: 1)
                HStack{
                    TextField("",text: $firstName)
                        .textFieldStyle(.plain).frame(width: 90)
                        .autocorrectionDisabled()
                        .placeholder(when: firstName.isEmpty) {
                            Text("Firstname")
                                .bold()
                                .foregroundColor(Constants.buttonColor)
                        }
                    Divider().frame(height: 20)
                    
                        TextField("",text: $lastName)
                        .textFieldStyle(.plain)
                        .autocorrectionDisabled()
                        .placeholder(when: lastName.isEmpty) {
                            Text("LastName")
                                .bold()
                                .foregroundColor(Constants.buttonColor)
                        }
                    Image(systemName: "person")
                }
                HStack {
                    Rectangle()
                        .frame(width: 95, height: 1)
                    Rectangle()
                        .frame(width: 240, height: 1)
                }
                
                HStack{
                    SecureField("", text: $password)
                        .autocorrectionDisabled()
                        .textFieldStyle(.plain)
                        .placeholder(when: password.isEmpty) {
                            Text("Password").bold()
                                .foregroundColor(Constants.buttonColor)
                        }
                    Image(systemName: "lock")
                }
                
                Rectangle()
                    .frame(width: 350, height: 1)
                
                Button {
                    register()
                } label: {
                    Text("Sign up")
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
                .alert(error, isPresented: $alert, actions: {}) // 4
                .keyboardShortcut(.defaultAction).onSubmit {
                    register()
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
    }

    func register() {
        print("User creating.....")
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if error != nil {
                self.error = error!.localizedDescription
                self.alert = true
            } else {
               
                print("SIGNED IN")
                self.AddUserInformationToFirebase()
                self.alert = false
                self.userIsLoggedIn = true
                
                guard let uid = Auth.auth().currentUser?.uid else {return}
                let name = self.firstName + " " + self.lastName
               
                authViewModel.postCredentials(uid, name, self.email)
                Auth.auth().signIn(withEmail: self.email, password: self.password)
            }
        }
        
        
    }
    private func AddUserInformationToFirebase() {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let userData = ["fname": self.firstName, "lname" : self.lastName, "email":self.email, "profileImageUrl": ""]
        Firestore.firestore().collection("users")
            .document(uid).setData(userData) { error in
                if let error = error {
                    print(error)
                    return
                    
                }
            }
    }
    
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

// typewriter effect: https://betterprogramming.pub/typewriter-effect-in-swiftui-ba81db10b570
