//
//  EditView.swift
//  test
//
//  Created by apprenant1 on 21/09/2022.
//

import SwiftUI

struct EditView: View {
    
    @State var name: String = ""
    @State var year: String = ""
    @State var introProfil: String = ""
    @State var profilPreference: String = ""
    @State var favorite: String = ""
    @State var categorieProfil: [String] = ["Drame","Horreur","Action","Romantique"]
    @State var categorie1: String = ""
    @State var categorie2: String = ""
    @State var categorie3: String = ""
    
    @Binding var users: UsersModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            HStack {
                Spacer()
                Text("Edit Profil")
                    .font(.title)
                    .padding(.horizontal)
                Button("Fermer") {
                    presentationMode.wrappedValue.dismiss()
                }.font(.title3)
                 .padding(.horizontal)

            }
            .padding()
            
            Form{
                Section("Change Name"){
                    TextField("Name", text: $name)
                }
                Section("Birthday"){
                    TextField("Year", text: $year)
                }
                Section("Introduction"){
                    TextEditor(text: $introProfil)
                        .frame(height: 90)
                }
                Section("Preferences"){
                    Picker("\(categorie1)", selection: $categorie1) {
                        ForEach(categorieProfil, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("\(categorie2)", selection: $categorie2) {
                        ForEach(categorieProfil, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("\(categorie3)", selection: $categorie3) {
                        ForEach(categorieProfil, id: \.self) {
                            Text($0)
                            
                        }
                    }
                }
                    .pickerStyle(.menu)
                Section("Favorite Movie"){
                    TextField("Your Favorite Movie", text: $favorite)
                }
            }
            Button("Save") {
                modifie()
                presentationMode.wrappedValue.dismiss()
            }

        }
    }
    func modifie() {
        users = UsersModel(name: name,year: year,tag1: categorie1 ,tag2: categorie2 ,tag3: categorie3 ,favoris: favorite ,description: introProfil)
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}
