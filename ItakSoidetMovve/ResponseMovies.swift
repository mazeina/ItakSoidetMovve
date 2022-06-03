//
//  ResponseMovies.swift
//  ItakSoidetMovve
//
//  Created by Сергей Шевелев on 31.05.2022.
//

import Foundation
 
struct ResponseMovies: Codable {
    let page: Int
    let results: [Movie]
    
    struct Movie: Codable {
        let id: Int
        let title: String
        let releaseDate: String
        let posterPath: String
        let overview: String
        var voteAverage: Double

        enum CodingKeys: String, CodingKey {
            case id
            case title
            case releaseDate = "release_date"
            case posterPath = "poster_path"
            case overview
            case voteAverage = "vote_average"
        }
    }
}
 
