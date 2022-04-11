//
//  Contants.swift
//  moviesapp
//
//  Created by Michael Mathews on 10/04/22.
//

import Foundation

struct Constants {
    static let apiKey = "c0d10580a1d8261a4e5dfaa26acd7ba2"
    
    struct URL {
        static let main = "https://api.themoviedb.org/"
        static let urlImages = "https://image.tmdb.org/t/p/w500"
    }
    
    struct Endpoints {
        static let urlListUpcomingMovies = "3/movie/upcoming"
        static let urlDetailMovie = "3/movie"
    }
}
