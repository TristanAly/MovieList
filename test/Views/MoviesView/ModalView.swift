//
//  ModalView.swift
//  test
//
//  Created by apprenant1 on 20/09/2022.
//

import SwiftUI

struct ModalView: View {
    
    @Binding var movieModel : [MovieModel]
    @State var title = ""
    @State var author = ""
    @State var date = ""
    @State var description = "Pitch"
    //    @State var categorie = ""
    @State var colorPitch = false
    @State var selectedType: Gender = .Drame
    @Environment(\.presentationMode) var presentationMode
    //    @Binding var selectedNewImage: UIImage
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                titleSheet
                ClosedSheet
            }.padding()
            formAddNewMovie
            Spacer()
            buttonSave
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        //        ModalView(movieModel: .constant([movieModel[0]))
        MovieList()
    }
}

extension ModalView {
    
    private var titleSheet: some View {
        Text("Ajoutez un film")
            .font(.title)
    }
    
    private var ClosedSheet: some View {
        Button("fermer"){
            presentationMode.wrappedValue.dismiss()
        }
        .font(.title3)
        .foregroundColor(.red)
        .padding(.horizontal,20)
    }
    
    private var formAddNewMovie: some View {
        VStack{
            Form{
                Section("Caracteristiques"){
                    TextField("Titre du film", text: $title)
                    TextField("Réalisateur", text: $author)
                    TextField("Année de sortie", text: $date)
                }
                Section("Image") {
                    ImageMovie()
                }
                Section("Synopsis"){
                    TextEditor(text: $description)
                        .foregroundColor(colorPitch ? .black : .gray)
                        .frame(height: 90)
                        .onTapGesture {
                            colorPitch.toggle()
                            if colorPitch {
                                description = ""
                            }
                        }
                }
                Section("Categories"){
                    Picker("", selection: $selectedType) {
                        ForEach(Gender.allCases, id: \.self) { gender in
                            Text(gender.rawValue)
                            
                        }
                    }
                    .foregroundColor(.red).pickerStyle(.menu)
                    .labelsHidden()
                }
            }
        }
        .font(.title3)
    }
    
    
    
    private var buttonSave: some View {
        HStack{
            Button("Sauvegarder"){
                addNewMovie()
                dismissModal()
            }
        }
    }
    
    func addNewMovie() {
        movieModel.append(MovieModel(image: "Revenant" , title: title, author: author, date: Int(date) ?? 0, categorie: selectedType , description: description))
    }
    func dismissModal() {
        presentationMode.wrappedValue.dismiss()
    }
}

//extension UIImage {
//    func toString() -> String? {
//
//        let pngData = self.pngData()
//
//        //let jpegData = self.jpegData(compressionQuality: 0.75)
//
//        return pngData?.base64EncodedString()
//    }
//}
