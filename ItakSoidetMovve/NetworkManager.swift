//
//  NetworkManager.swift
//  ItakSoidetMovve
//
//  Created by Сергей Шевелев on 31.05.2022.
//

import Foundation

class NetworkManager {
//MARK: - MOVIES
    func getDiscoverMovies() {
        if let url = URL(string: Constants.NetWork.fullUrlMovies) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("error")
                    return
                }
                
                if let safeData = data {
                    if let movies = self.moviesParseJSON(safeData) {
                        print(movies)
                    }
                }
            }
            task.resume()
        }
    }


    func moviesParseJSON(_ data: Data) -> ResponseMovies? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ResponseMovies.self, from: data)
            return decodedData
        } catch {
            print("error")
            return nil
        }
    }
    
//MARK: - TV Shows
    func getDiscoverTV() {
        if let url = URL(string: Constants.NetWork.fullUrlTV) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("error")
                    return
                }
                
                if let safeData = data {
                    if let tv = self.TVParseJSON(safeData) {
                        print(tv)
                    }
                }
            }
            task.resume()
        }
    }


    func TVParseJSON(_ data: Data) -> ResponseTV? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ResponseTV.self, from: data)
            return decodedData
        } catch {
            print("error")
            return nil
        }
    }
}

