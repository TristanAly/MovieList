//
//  PictureProfil.swift
//  test
//
//  Created by apprenant1 on 21/09/2022.
//

import SwiftUI

struct PictureProfil: View {
    
       @State var changePhoto = false
       @State var openCameraRoll = false
       @State var selectedImage = UIImage()
       
       
       var body: some View {
           ZStack(alignment: .bottomTrailing){
               
               Button(action: {
                   changePhoto = true
                   openCameraRoll = true
                   
               }, label: {
                   VStack{
                       if changePhoto {
                           Image(uiImage: selectedImage)
                               .profilPhotoMod()
                       }else {
                           Image("trycia")
                               .profilPhotoMod()
                       }
                   }.background(Circle().stroke(.red, lineWidth: 5).frame(width: 200, height: 150))
               })
                   Image(systemName: "pencil")
                       .font(.system(size: 25))
                       .foregroundColor(.white)
                       .padding(3)
                       .background(Circle().fill(Color.gray))
                       .offset(x: -55)
           }
           .sheet(isPresented: $openCameraRoll) {
               ImagePicker(selectedPhoto: $selectedImage, sourceType: .photoLibrary)
           }
    }
}

struct PictureProfil_Previews: PreviewProvider {
    static var previews: some View {
        PictureProfil()
    }
}

extension Image{
    
    func profilPhotoMod() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 250, height: 150)
            .clipShape(Circle())
    }
}
