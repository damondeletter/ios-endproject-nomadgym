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
    var body: some View {
        ZStack {
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
                    Button {
                        isShowingConfirmation = true
                    } label: {
                        Label("SIGN OUT", systemImage: "rectangle.portrait.and.arrow.right")

                            .bold()
                            .frame(width: 200, height: 40)
                            .background {
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(Color.hexColour(hexValue: 0x6715f9))
                            }
                            .foregroundColor(.white)
                            
                    }
                    
                    .buttonStyle(.bordered)
                    .confirmationDialog("Do you really wanna sign out?", isPresented: $isShowingConfirmation) {
                        Button("I'm sure") {
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
