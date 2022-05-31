//
//  NetworkManager.swift
//  ItakSoidetMovve
//
//  Created by Сергей Шевелев on 31.05.2022.
//

import Foundation

class NetworkManager {
    
// MARK: - Movies
   
    func getDiscoverMovies(completionHandler: @escaping (MoviesModel) -> Void) {
        if let url = URL(string: Constants.NetWork.fullUrlMovies) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("error")
                    return
                } 
                if let safeData = data {
                    if let movies = self.moviesParseJSON(withData: safeData) {
                        completionHandler(movies)
                    }
                }
            }
            task.resume()
        }
    }
     
    func moviesParseJSON(withData data: Data) -> MoviesModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ResponseMovies.self, from: data)
            guard let movies = MoviesModel(movies: decodedData) else { return nil }
            return movies
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }

// MARK: - TV Shows
    
    func getDiscoverTV(completionHandler: @escaping (TvShowModel) -> Void) {
        if let url = URL(string: Constants.NetWork.fullUrlTV) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("error")
                    return
                }
                if let safeData = data {
                    if let tv = self.TVParseJSON(withData: safeData) {
                        completionHandler(tv)
                    }
                }
            }
            task.resume()
        }
    }


    func TVParseJSON(withData data: Data) -> TvShowModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ResponseTV.self, from: data)
            guard let tv = TvShowModel(tvShow: decodedData) else { return nil }
            return tv
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}

