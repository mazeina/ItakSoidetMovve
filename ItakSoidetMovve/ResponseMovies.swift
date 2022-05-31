//
//  ResponseMovies.swift
//  ItakSoidetMovve
//
//  Created by Сергей Шевелев on 31.05.2022.
//

import Foundation

struct ResponseMovies: Decodable {
    let page: Int
    let results: [Movie]
    
    struct Movie: Decodable {
        let id: Int
        let title: String
        let release_date: String
        let vote_average: Double
        let poster_path: String
    }
}
