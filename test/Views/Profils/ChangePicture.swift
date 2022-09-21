//
//  ChangePicture.swift
//  test
//
//  Created by apprenant1 on 21/09/2022.
//

import Foundation
import UIKit
import SwiftUI


//Vue qui représente la vue de UIKIT controller
struct ImagePicker: UIViewControllerRepresentable {
// Controleur de la librairie + la source quand on va prendre une image ou un media type
    @Binding var selectedPhoto: UIImage
    @Environment(\.presentationMode) var isPresented
    var sourceType: UIImagePickerController.SourceType
    
    
//    Lui montrer l'endroit ou il va aller chercher et mettre à jour l'objet et return la librairie d'objet
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = self.sourceType
        imagePicker.delegate = context.coordinator // confirming the delegate
        return imagePicker
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    // Connecting the Coordinator class with this struct
       func makeCoordinator() -> Coordinator {
           return Coordinator(picker: self)
       }
    
}

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var picker: ImagePicker
    
    init(picker: ImagePicker) {
        self.picker = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let Photo = info[.originalImage] as? UIImage {
            self.picker.selectedPhoto = Photo
        }
    self.picker.isPresented.wrappedValue.dismiss()
}
}
