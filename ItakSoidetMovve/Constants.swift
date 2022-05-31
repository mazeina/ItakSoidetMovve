//
//  Constants.swift
//  ItakSoidetMovve
//
//  Created by Nikita Nesporov on 30.05.2022.
//

import Foundation
 
struct Constants {
    static let apiKey = "32ea20e318793cf10469df41ffe5990d"
    static let filmsNibName = "FilmsTableViewCell"
    static let serialsNibName = "SerialsTableViewCell"
    static let actorsNibName = "ActorsListTableViewCell"
    static let filmsCellID = "FilmsCell"
    static let serialsCellID = "SerialsCell"
    static let actorsCellID = "ActorsCell" 
    static let detailSegueId = "detailSegue"
    
    struct Colors {
        static let darkGray = "backgroundColor"
        static let lightGray = "textColor"
        static let white = "topicColor"
        static let red = "buttonAndTabBarColor"
    }
    
    struct NetWork {
        static let baseUrl = "https://api.themoviedb.org/3/"
        static let discoverMovies = "discover/movie"
        static let discoverTV = "discover/tv"
        static var fullUrlMovies = "\(baseUrl)\(discoverMovies)?api_key=\(Constants.apiKey)&language=ru"
        static var fullUrlTV = "\(baseUrl)\(discoverTV)?api_key=\(Constants.apiKey)&language=ru"
    }
}
