//
//  DetailView.swift
//  test
//
//  Created by apprenant1 on 20/09/2022.
//

import SwiftUI

struct DetailView: View {
    
    var movies: MovieModel
    @State var isLike: Bool = false
    
    var body: some View {
        ScrollView{
            VStack{
                movieTitle
                moviePrint
                descriptionMovie
                Spacer()
            }
            .navigationTitle(movies.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        isLike.toggle()
                    } label: {
                        Image(systemName: isLike ? "heart.fill" : "heart")
                            .foregroundColor(.red)
                            .font(.title3)
                    }
                }
            }
            
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movies: movieModel[1])
    }
}

extension DetailView {
    
    private var descriptionMovie: some View {
        VStack(alignment: .center){
            Text(movies.categorie.rawValue.capitalized)
                .padding()
            Text(movies.description)
                .multilineTextAlignment(.center)
                .padding(5)
        }
        .padding()
    }
    
    private var movieTitle: some View {
        Text(movies.title)
            .font(.largeTitle)
            .bold()
            .padding()
    }
    
    private var moviePrint: some View {
        VStack{
            Text(movies.author)
                .font(.system(size: 25))
                .bold()
                .padding(2)
            Text("\(String(movies.date))")
                .font(.subheadline)
            Image(movies.image)
                .resizable()
                .frame(width: 200,height: 270)
                .padding()
        }
        .padding()
    }
    
}
