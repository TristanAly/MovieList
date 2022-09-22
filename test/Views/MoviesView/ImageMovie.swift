//
//  ImageMovie.swift
//  test
//
//  Created by apprenant1 on 21/09/2022.
//

import SwiftUI

struct ImageMovie: View {
        
        @State var changeImage = false
        @State var openArchives = false
        @State var selectedNewImage = UIImage()
        
        
        var body: some View {
            ZStack(alignment: .bottomTrailing){
                
                Button(action: {
                    changeImage = true
                    openArchives = true
                    
                }, label: {
                    VStack{
                        if changeImage{
                            Image(uiImage: selectedNewImage)
                                .AffichePhotoMod()
                        }else {
                            Image("Trycia")
                                .AffichePhotoMod()
                        }
                    }
                })
            }
            .sheet(isPresented: $openArchives) {
                ImagePicker(selectedPhoto: $selectedNewImage, sourceType: .photoLibrary)
            }
     }
 }


struct ImageMovie_Previews: PreviewProvider {
    static var previews: some View {
        ImageMovie()
    }
}

extension Image{
    
    func AffichePhotoMod() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 270)
            .clipShape(Rectangle())
    }
}
