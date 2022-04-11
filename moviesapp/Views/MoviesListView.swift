//
//  MoviesListView.swift
//  moviesapp
//
//  Created by Michael Mathews on 10/04/22.
//

import SwiftUI

struct MoviesListView: View {
    
    @ObservedObject var moviesViewModel = MoviesListViewModel()
    
    var body: some View {
        
        if moviesViewModel.isLoading {
            ProgressView()
        } else {
            
            List(moviesViewModel.movies) { movie in
                MovieListItem(movie: movie)
            }
            
        }
        
        HStack {
            Button {
                moviesViewModel.prevPage()
            } label: {
                Image(systemName: "arrow.backward")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(moviesViewModel.prevDisabled)
            
            Spacer()
            
            Text( String(describing: moviesViewModel.actualPage) + "/" + String(moviesViewModel.totalPages))
            
            Spacer()
            
            Button {
                moviesViewModel.nextPage()
            } label: {
                Image(systemName: "arrow.forward")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            .disabled(moviesViewModel.nextDisabled)
        }.padding()
    }
}
