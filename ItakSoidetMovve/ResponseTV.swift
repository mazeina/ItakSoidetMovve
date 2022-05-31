//
//  ResponseTV.swift
//  ItakSoidetMovve
//
//  Created by Сергей Шевелев on 31.05.2022.
//

import Foundation

struct ResponseTV: Codable {
    let page: Int
    let results: [TV]
    
    struct TV: Codable {
        var id: Int
        var name: String
        var poster_path: String
        var posterPath: String {
            poster_path
        }
    }
}
 
