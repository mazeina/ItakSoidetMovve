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
        let release_date: String
        let poster_path: String
        
        var releaseDate: String {
            release_date
        }
        var posterPath: String {
            poster_path
        }
    }
}
 
