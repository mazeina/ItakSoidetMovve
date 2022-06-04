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
        var id: Int
        var name: String
        var character: String
        var profile_path: String = "/zwa0p3OSxmT5gLFRcKvM0n3rXx0.jpg"
        //
//        var actorId: Int
//        var actorName: String
//        var actorImage: String
//        var character: String
        
//        enum CodingKeys: String, CodingKey {
//            case actorId = "id"
//            case actorName = "name"
//            case actorImage = "profile_path"
//            case character
//        }
    }
}
