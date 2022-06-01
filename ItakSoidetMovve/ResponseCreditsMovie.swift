//
//  ResponseCreditsMovie.swift
//  ItakSoidetMovve
//
//  Created by Артем Оголец on 01.06.2022.
//

import Foundation

struct ResponseCreditsMovie: Codable {
    
    let id: Int
    let cast: [Cast]
    
    struct Cast: Codable {
        var actorId: Int
        var actorName: String
        var actorImage: String
        var character: String
        
        enum CodingKeys: String, CodingKey {
            case actorId = "id"
            case actorName = "name"
            case actorImage = "profile_path"
            case character
        }
    }
}
