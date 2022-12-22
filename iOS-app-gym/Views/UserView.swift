//
//  UserView.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 21/12/2022.
//

import SwiftUI
import Firebase
import Kingfisher

struct UserView: View {
    @State private var selectedTab : Tab = .person
    @State private var showImagePicker = false
    @State private var selectedImage : UIImage?
    @State private var profileImage : KFImage?
    @State private var isShowingConfirmation = false
    @State var refresh: Bool = false
    @EnvironmentObject var viewModel : AuthViewModel
    let backgroundlower = LinearGradient(gradient: Gradient(colors: [.white,Color.hexColour(hexValue: 0xF3F4FA),Color.hexColour(hexValue: 0xbb94fe)]), startPoint: .top, endPoint: .bottom)
    var body: some View {
        ZStack {
            backgroundlower
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: 0, y: 300))
                path.addCurve(to: CGPoint(x: 430, y: 200), control1: CGPoint(x: 175, y: 350), control2: CGPoint(x: 250, y: 80))
                path.addLine(to: CGPoint(x: 450, y: 0))
            }.fill(.white)
            VStack {
                if let user = viewModel.userInCurrentSession {
                    Button {
                        showImagePicker.toggle()
                    }label: {
                         if viewModel.userInCurrentSession?.profileImageUrl != "" {
                            KFImage(URL(string: viewModel.userInCurrentSession!.profileImageUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 180, height: 180)
                                .clipShape(Circle())
                        }
                        else {
                            Image("profilepicture")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 180, height: 180)
                                .clipShape(Circle())
                        }
                        
                    }
                    .sheet(isPresented: $showImagePicker, onDismiss: loadingImage) {
                        ImageSelectorController(selectedImage: $selectedImage)
                    }
                    .padding(.top, 10)
                    Text(user.fname)
                        .bold().font(.title)
                    Text(user.lname)
                        .bold().font(.title2)
                    Text(user.email)
                        .font(.body)
                    Spacer()
                    Text("Coming soon ")
                    Text("All your stats and more!")
                    Spacer()
                    Button {
                        isShowingConfirmation = true
                    } label: {
                        Text("SIGN OUT")

                            .bold()
                            .frame(width: 200, height: 40)
                            .background {
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(Color.hexColour(hexValue: 0x6715f9))
                            }
                            .foregroundColor(.white)
                            
                    }
                    
                    
                    .confirmationDialog("Do you really wanna sign out?", isPresented: $isShowingConfirmation) {
                        Button("I'm sure") {
                            selectedTab = .house
                            viewModel.signOut()
                            
                        }
                    
                    }
                    
                }
                Spacer()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
    }

    func loadingImage() {
        guard let selectedImage = selectedImage else {return}
        
        viewModel.uploadProfilePicture(selectedImage)
        print("Versturen begonnen")
        profileImage = KFImage(URL(string: viewModel.userInCurrentSession!.profileImageUrl))
        update()
    }
    func update() {
       refresh.toggle()
    }

}

struct UserView_Previews: PreviewProvider {

    static var previews: some View {
        UserView().environmentObject(AuthViewModel())
    }
}
