//
//  ContentView.swift
//  test
//
//  Created by apprenant1 on 19/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView{
            MovieList()
                .tabItem {
                    Image(systemName: "film.circle")
                        .font(.title)
                    Text("Movies")
                }
            ProfilView()
                .tabItem {
                        Image(systemName: "person.circle")
                            .font(.title)
                        Text("Profil")
                }
        }
        .accentColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



