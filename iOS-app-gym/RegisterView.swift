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
    @State var text : String = ""
    let welcomeText : String = "Welcome to nomadgym"
    let backgroundlower = LinearGradient(gradient: Gradient(colors: [.white,Color.hexColour(hexValue: 0xF3F4FA),Color.hexColour(hexValue: 0xbb94fe)]), startPoint: .top, endPoint: .bottom)
    let buttonColor = Color.hexColour(hexValue: 0x6715f9)
    
    @State private var writing = false
    @State private var movingCursor = false
    @State private var blinkingCursor = false
    @State private var userIsLoggedIn = false
    var body: some View {
        
        ZStack {
            backgroundlower
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: 0, y: 300))
                path.addCurve(to: CGPoint(x: 430, y: 200), control1: CGPoint(x: 175, y: 350), control2: CGPoint(x: 250, y: 80))
                path.addLine(to: CGPoint(x: 450, y: 0))
            }
            .fill(.white)
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
                    .foregroundColor(buttonColor)
                ZStack(alignment: .leading) {
                    Text("This is Register")
                    
                        .font(.system(size: 17, weight: .bold,design: .rounded))
                        .mask(Rectangle().offset(x: writing ? 0 : -150))
                        .offset(y:-185)
                        .foregroundColor(buttonColor)
                    
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
                    
                        .placeholder(when: email.isEmpty) {
                            Text("Email")
                                .bold()
                                .foregroundColor(buttonColor)
                        }
                    Image(systemName: "envelope")
                }
                
                Rectangle()
                    .frame(width: 350, height: 1)
                
                HStack{
                    SecureField("", text: $password)
                        .textFieldStyle(.plain)
                        .placeholder(when: password.isEmpty) {
                            Text("Password").bold()
                                .foregroundColor(buttonColor)
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
                                .fill(buttonColor)
                        }
                        .foregroundColor(.white)
                }
                .padding(.top)
                .offset(y: 100)
                Button {
                    login()
                } label: {
                    Text("I'm already a member! Login")
                        .foregroundColor(buttonColor)
                }
                .padding(.top)
                .offset(y: 100)
                
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
    }
    func login () {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }

    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
            
        }
    }
    
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
