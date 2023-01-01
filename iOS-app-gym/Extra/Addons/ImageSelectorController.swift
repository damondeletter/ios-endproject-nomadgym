//
//  ImageSelectorController.swift
//  iOS-app-gym
//
//  Created by Damon De Letter on 21/12/2022.
//

import SwiftUI

struct ImageSelectorController : UIViewControllerRepresentable {
    @Binding var selectedImage : UIImage?
    @Environment(\.presentationMode) var presentationMode
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

extension ImageSelectorController {
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImageSelectorController
        
        init(_ parent: ImageSelectorController) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
            guard let image = info[.originalImage] as? UIImage else { return}
            parent.selectedImage = image
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
}
//https://www.youtube.com/watch?v=3pIXMwvJLZs
