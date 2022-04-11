//
//  MovieDetailsView.swift
//  moviesapp
//
//  Created by Michael Mathews on 10/04/22.
//

import SwiftUI

struct MovieDetailsView: View {
    
    var movie: Movie
    
    var body: some View {
        Text(movie.title)
    }
}
