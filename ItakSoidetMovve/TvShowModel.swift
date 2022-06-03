//
//  TvShowModel.swift
//  ItakSoidetMovve
//
//  Created by Nikita Nesporov on 01.06.2022.
//

import Foundation

struct TvShowModel {
    let id: Int
    var idString: String {
        return String(describing: id)
    }
    
    let name: String
    let posterPath: String
    
    init?(tvShow: ResponseTV) {
        id = tvShow.results.first?.id ?? 0
        name = tvShow.results.first?.name ?? "nil name"
        posterPath = tvShow.results.first?.posterPath ?? "nil posterPath"
    }
}
 
 
