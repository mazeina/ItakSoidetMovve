//
//  Model.swift
//  ItakSoidetMovve
//
//  Created by Nikita Nesporov on 30.05.2022.
//

import Foundation
 
struct MoviesModel {
    let id: Int
    var idString: String {
        return String(describing: id)
    }
    
    let title: String
    let releaseDate: String
    let posterPath: String
    
    init?(movies: ResponseMovies) {
        id = movies.results.first?.id ?? 0 
        title = movies.results.first?.title ?? "nil title"
        releaseDate = movies.results.first?.release_date ?? "nil releaseDate" 
        posterPath = movies.results.first?.poster_path ?? "nil posterPath"
    }
}

 
