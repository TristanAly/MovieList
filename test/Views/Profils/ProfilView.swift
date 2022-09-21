//
//  ProfilView.swift
//  test
//
//  Created by apprenant1 on 20/09/2022.
//

import SwiftUI

struct ProfilView: View {
    
    @State var presentEdit: Bool = false
    @State var users = UsersModel(name: "Trycia", year: "20", tag1: "Drame", tag2: "Horreur", tag3: "Romantique", favoris: "Titanic", description: "Hello! im a movie fan and most all I love Léonardo Di Caprio 💕")
    
    
    var body: some View {
        NavigationView{
            VStack{
                PictureProfil()
                    .shadow(color: Color.black.opacity(0.5),radius: 10)
                    .padding(.top, 20)
                Text("@\(users.name)")
                    .font(.title)
                    .bold()
                    .padding()
                Text("\(users.year) years")
                    .padding()
                Text(users.description)
                    .multilineTextAlignment(.center)
                    .padding()
        preferencesList
    }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button{
                    presentEdit.toggle()
                } label: {
                    Text("Edit")
                        .font(.title3)
                        .foregroundColor(.red)
                }
            }
        }
        .sheet(isPresented: $presentEdit) {
            EditView(users: $users)
        }
        .navigationTitle("Profil")
        .navigationBarTitleDisplayMode(.inline)
}
}
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}

extension ProfilView {
    
    private var preferencesList: some View {
        List{
            Section{
                Text("\(users.tag1), \(users.tag2), \(users.tag3)")
            } header: {
                Text("Genre Préférée")
                    .font(.title2)
                    .foregroundColor(.black)
            }
            Section{
                Text(users.favoris)
            } header: {
                Text("Film Préférée")
                    .font(.title2)
                    .foregroundColor(.black)
            }
            
        }.listStyle(.sidebar)
    }
}


