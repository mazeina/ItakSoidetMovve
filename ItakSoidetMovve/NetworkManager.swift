//
//  NetworkManager.swift
//  ItakSoidetMovve
//
//  Created by Сергей Шевелев on 31.05.2022.
//

import Foundation

class NetworkManager {
    
// MARK: - Movies
   
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
}

