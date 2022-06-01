//
//  CreditsMovieModel.swift
//  ItakSoidetMovve
//
//  Created by Артем Оголец on 01.06.2022.
//

import Foundation

struct CreditsMovieModel {
    
    var actorId: Int
    var actorName: String
    var actorImage: String
    var character: String
    
    init?(tvCredits: ResponseCreditsMovie) {
        actorId = tvCredits.cast.first?.actorId ?? 0
        actorName = tvCredits.cast.first?.actorName ?? "nill name"
        actorImage = tvCredits.cast.first?.actorImage ?? "nill actor image"
        character = tvCredits.cast.first?.character ?? "nill character"
    
    }
}
