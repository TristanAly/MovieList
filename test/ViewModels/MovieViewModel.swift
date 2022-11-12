//
//  MovieViewModel.swift
//  test
//
//  Created by apprenant1 on 03/10/2022.
//

import Foundation
import Combine

class MovieViewModel: ObservableObject {

    @Published var movie: [MovieModel] = []
    @Published var isLike: Bool = false
    @Published var search: String = ""


}
