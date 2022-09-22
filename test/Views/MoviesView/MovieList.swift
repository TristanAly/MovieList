//
//  MovieList.swift
//  test
//
//  Created by apprenant1 on 20/09/2022.
//

import SwiftUI

struct MovieList: View {
   
    @State var isPresented = false
    @State var search = ""
    
    @State private var movieModel = [ MovieModel(image: "Infiltrés" ,title: "Les Infiltrés", author: "by Martin Scorcése", date: 2006, categorie: .Action, description: " À Boston, une lutte sans merci oppose la police à la mafia irlandaise dirigée par Frank Costello, parrain des quartiers sud. Ce dernierva racketter une épicerie et repère un enfant,Colin Sullivan. Il lui fait comprendre comment le monde marche."),MovieModel(image: "inception" ,title: "Inception", author: "by Martin Scorcése", date: 2006 , categorie: .Action, description: " À Boston, une lutte sans merci oppose la police à la mafia irlandaise dirigée par Frank Costello, parrain des quartiers sud. Ce dernierva racketter une épicerie et repère un enfant,Colin Sullivan. Il lui fait comprendre comment le monde marche."),MovieModel(image: "Revenant" ,title: "Les Revenants", author: "by Martin Scorcése", date: 2006, categorie: .Action, description: " À Boston, une lutte sans merci oppose la police à la mafia irlandaise dirigée par Frank Costello, parrain des quartiers sud. Ce dernierva racketter une épicerie et repère un enfant,Colin Sullivan. Il lui fait comprendre comment le monde marche.")]
    
//    @Binding var selectedNewImage: UIImage
    
    var body: some View {
        NavigationView{
            
                listMovie
           
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        isPresented.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title3)
                            .foregroundColor(.red)
                    }
                }
            }
            .sheet(isPresented: $isPresented) {
                ModalView(movieModel: $movieModel)
            }
            .navigationTitle("Movies")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
    }
}

extension MovieList {
    
    private var listMovie: some View {
        VStack{
            List{
                ForEach(searchResults, id: \.title) { movie in
                    NavigationLink{DetailView(movies: movie)
                    } label: {
                        HStack{
                            Image(movie.image)
                                .resizable()
                                .frame(width: 40,height: 50)
                            HStack(spacing: 5){
                                Text(movie.title.capitalized)
                                    .font(.title2)
                                    .bold()
                                Text("(\(String(movie.date)))")
                                    .font(.subheadline)
                                
                            }
                            .padding()
                        }
                    }
                    
                }
                .onDelete(perform: delete)
            }
            .searchable(text: $search)
        }
    }
    var searchResults: [MovieModel] {
            if search.isEmpty {
                return movieModel
            } else {
                return movieModel.filter{ item in
                    item.title.contains(search)
                }
            }
        }
    
    func delete(at offsets: IndexSet) {
        // delete the objects here
        movieModel.remove(atOffsets: offsets)
    }
 }
