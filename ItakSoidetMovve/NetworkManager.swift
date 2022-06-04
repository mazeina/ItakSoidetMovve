//
//  NetworkManager.swift
//  ItakSoidetMovve
//
//  Created by Сергей Шевелев on 31.05.2022.
//

import Foundation

class NetworkManager {
    
// MARK: - Movies
    static let shared: NetworkManager = NetworkManager()
   
    func getDiscoverMovies(completion: @escaping((ResponseMovies) -> ())) {
        if let url = URL(string: Constants.NetWork.fullUrlMovies) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("error")
                    return
                }

                if let safeData = data {
                    if let movie = self.parseJSON(safeData) {
                        completion(movie)
                    }
                }
            }
            task.resume()
        }
    }


    func parseJSON(_ data: Data) -> ResponseMovies? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ResponseMovies.self, from: data)
            return decodedData
        } catch {
            print("error")
            return nil
        }
    }

// MARK: - TV Shows
    
    func getDiscoverTV(completion: @escaping ((ResponseTV) -> ())) {
        if let url = URL(string: Constants.NetWork.fullUrlTV) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("error")
                    return
                }
                if let safeData = data {
                    if let tv = self.TVParseJSON(withData: safeData) {
                        completion(tv)
                    }
                }
            }
            task.resume()
        }
    }


    func TVParseJSON(withData data: Data) -> ResponseTV? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ResponseTV.self, from: data)
            return decodedData
            //guard let tv = ResponseTV(tvShow: decodedData) else { return nil }
            //return tv
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
    
    // MARK: - Movie Actors

    func getDiscoverCreditsMovie(completion: @escaping((ResponseCreditsMovie) -> ())) {
        print(Constants.NetWork.fullUrlCreditsMovie)
        if let url = URL(string: Constants.NetWork.fullUrlCreditsMovie) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("error getDiscoverCreditsMovie")
                    return
                }

                if let safeData = data {
                    if let creditsMovie = self.parseJSONCreditsMovie(safeData) {
                        print("creditsMovie \(creditsMovie)")
                        completion(creditsMovie)
                    }
                }
            }
            task.resume()
        }
    }

    func parseJSONCreditsMovie(_ data: Data) -> ResponseCreditsMovie? {
        print("data-----------")
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ResponseCreditsMovie.self, from: data)
            return decodedData
        } catch {
            print("error parseJSONCreditsMovie")
            return nil
        }
    }
    
    // MARK: - TV Actors

    func getDiscoverCreditsMovie(completion: @escaping((ResponseCreditsTV) -> ())) {
        if let url = URL(string: Constants.NetWork.fullUrlCreditsTV) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("error getDiscoverCreditsMovie")
                    return
                }

                if let safeData = data {
                    if let creditsTV = self.parseJSONCreditsTV(safeData) {
                        print("creditsTV \(creditsTV)")
                        completion(creditsTV)
                    }
                }
            }
            task.resume()
        }
    }

    func parseJSONCreditsTV(_ data: Data) -> ResponseCreditsTV? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ResponseCreditsTV.self, from: data)
            return decodedData
        } catch {
            print("error parseJSONCreditsTV")
            return nil
        }
    }
}

