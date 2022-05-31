//
//  NetworkManager.swift
//  ItakSoidetMovve
//
//  Created by Сергей Шевелев on 31.05.2022.
//

import Foundation

class NetworkManager {
    func getDiscoverMovies() {
        if let url = URL(string: Constants.NetWork.fullUrlMovies) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("error")
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        print(weather)
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
}

