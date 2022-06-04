//
//  ResponseTV.swift
//  ItakSoidetMovve
//
//  Created by Сергей Шевелев on 31.05.2022.
//

import Foundation
import UIKit

//struct ResponseTV: Codable {
//    let page: Int
//    let results: [TV]
//
//    struct TV: Codable {
//        var id: Int
//        var name: String
//        var poster_path: String
//        var first_air_date: String
//        var posterPath: String {
//            poster_path
//        }
//        var firstAirDate: String {
//            first_air_date
//        }
//    }
//}

struct ResponseTV: Codable {
    let page: Int
    let results: [TV]
    
    struct TV: Codable {
        var id: Int
        var name: String
        var posterPath: String
        var firstAirDate: String
        var overview: String
        var voteAverage: Double
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case posterPath = "poster_path"
            case firstAirDate = "first_air_date"
            case overview
            case voteAverage = "vote_average"
        }
    }
}
 
