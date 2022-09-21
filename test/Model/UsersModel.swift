//
//  UsersModel.swift
//  test
//
//  Created by apprenant1 on 21/09/2022.
//

import Foundation


struct UsersModel: Identifiable {
    var id = UUID()
    var name: String
    var year: String
//    var categories: [String]
    var tag1: String
    var tag2: String
    var tag3: String
    var favoris: String
    var description: String
}
