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
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: Constants.URL.urlImages + (movie.poster_path ?? "/kqjL17yufvn9OVLyXYpvtyrFfak.jpg") )) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
                } placeholder: {
                    ProgressView().frame(height: 200)
                }
                
                Text(movie.title)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text(String(describing: movie.vote_average))
                    .font(.caption)
                    .multilineTextAlignment(.center)
                
                Text(String(describing: movie.release_date))
                    .font(.caption)
                    .multilineTextAlignment(.center)
                
                Text(movie.overview)
                    .padding()
                
            }
        }
    }
}
