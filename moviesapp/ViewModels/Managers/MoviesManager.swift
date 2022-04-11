//
//  MoviesManager.swift
//  moviesapp
//
//  Created by Michael Mathews on 10/04/22.
//

import Foundation

class MoviesManager {
    
    func getPaginatedMovies(page: Int, completion: @escaping(Movies) -> () ) {
        
        print("Loading data from server")
        guard let endpoint = URL(string: Constants.URL.main + Constants.Endpoints.urlListUpcomingMovies + "?page=\(page)&api_key=\(Constants.apiKey)") else {
            fatalError("URL provided is not accesible")
        }
        
        URLSession.shared.dataTask(with: endpoint) { data, response, error in
            
            guard let data = data, error == nil, let response = response as? HTTPURLResponse else {
                return
            }
            
            if response.statusCode == 200 {
                do {
                    let movies = try JSONDecoder().decode(Movies.self, from: data)
                    completion(movies)
                } catch let error {
                    print("Error trying to parse JSON: \(error)")
                }
            } else if response.statusCode == 401 {
                print("Error 401")
            }
            
        }.resume()
    }
}
