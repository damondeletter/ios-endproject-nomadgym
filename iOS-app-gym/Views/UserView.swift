//
//  UserView.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 21/12/2022.
//

import SwiftUI
import Firebase

struct UserView: View {
    @State private var showImagePicker = false
    @State private var selectedImage : UIImage?
    @State private var profileImage : Image?
    @EnvironmentObject var viewModel : AuthViewModel
    var body: some View {
        ScrollView {
            VStack {
                Button {
                    showImagePicker.toggle()
                }label: {
                    if let profileImage = profileImage {
                        profileImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 180, height: 180)
                            .clipShape(Circle())
                    } else {
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
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    func loadingImage() {
        guard let selectedImage = selectedImage else {return}
        profileImage = Image(uiImage: selectedImage)
        viewModel.uploadProfilePicture(selectedImage)
    }

}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
