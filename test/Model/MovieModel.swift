//
//  MovieModel.swift
//  test
//
//  Created by apprenant1 on 20/09/2022.
//

import Foundation
import SwiftUI

enum Gender: String, CaseIterable {
    case Action
    case Romantique
    case Thriller
    case Horreur
    case Drame
//
//    var id: Gender { self }
}

struct MovieModel: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var author: String
    var date: Int
    var categorie: Gender
    var description: String

}

var movieModel = [ MovieModel(image: "Infiltrés" ,title: "Les Infiltrés", author: "by Martin Scorcése", date: 2006, categorie: .Action, description: " À Boston, une lutte sans merci oppose la police à la mafia irlandaise dirigée par Frank Costello, parrain des quartiers sud. Ce dernierva racketter une épicerie et repère un enfant,Colin Sullivan. Il lui fait comprendre comment le monde marche."),MovieModel(image: "inception" ,title: "Inception", author: "by Martin Scorcése", date: 2006 , categorie: .Action, description: " À Boston, une lutte sans merci oppose la police à la mafia irlandaise dirigée par Frank Costello, parrain des quartiers sud. Ce dernierva racketter une épicerie et repère un enfant,Colin Sullivan. Il lui fait comprendre comment le monde marche."),MovieModel(image: "Revenant" ,title: "Les Revenants", author: "by Martin Scorcése", date: 2006, categorie: .Action, description: " À Boston, une lutte sans merci oppose la police à la mafia irlandaise dirigée par Frank Costello, parrain des quartiers sud. Ce dernierva racketter une épicerie et repère un enfant,Colin Sullivan. Il lui fait comprendre comment le monde marche.")]


