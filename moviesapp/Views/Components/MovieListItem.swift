//
//  MovieListItem.swift
//  moviesapp
//
//  Created by Michael Mathews on 10/04/22.
//

import SwiftUI

struct MovieListItem: View {
    
    var movie: Movie
    
    var body: some View {
        NavigationLink(
            destination: MovieDetailsView(movie: movie)
        ) {
            HStack {
                AsyncImage(url: URL(string: Constants.URL.urlImages + (movie.poster_path ?? "/kqjL17yufvn9OVLyXYpvtyrFfak.jpg") )) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .layoutPriority(-1)
                        .frame(width: 60, height: 60)
                        .cornerRadius(10)
                        .clipped()
                } placeholder: {
                    ProgressView().frame(width: 60, height: 60)
                }
                
                VStack(alignment: .leading) {
                    Text(movie.title)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                        .padding(.bottom, 5)
                    Text(movie.release_date)
                        .font(.caption)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color(red: 0.74, green: 0.74, blue: 0.74))
                }
            }
        }
    }
}
