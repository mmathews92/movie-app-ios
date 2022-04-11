//
//  MovieModel.swift
//  moviesapp
//
//  Created by Michael Mathews on 10/04/22.
//

import Foundation

struct Movies: Decodable {
    var list: [Movie]
    var totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case list = "results"
        case totalPages = "total_pages"
    }
}

struct Movie: Identifiable, Decodable {
    var id: Int
    var poster_path: String?
    var title: String
    var vote_average: Float
    var release_date: String
    var overview: String
}
