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
    @State var categorie = "Drame"
    @State var colorPitch = false
    var categorieArray = ["Drame", "Romantique", "Horreur", "Action"]
    @Environment(\.presentationMode) var presentationMode
    
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
                    Picker("\(categorie)", selection: $categorie) {
                        ForEach(categorieArray, id: \.self) {
                            Text($0)
                            
                        }
                    }
                    .foregroundColor(.red)
                    .pickerStyle(.menu)
                }
            }.font(.title3)
        }
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
        movieModel.append(MovieModel(image: "Revenant", title: title, author: author, date: Int(date) ?? 0, categorie: categorie, description: description))
    }
    func dismissModal() {
        presentationMode.wrappedValue.dismiss()
    }
    func deleteMovie() {
        //
    }
}
