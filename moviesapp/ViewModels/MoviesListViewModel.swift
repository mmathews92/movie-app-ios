//
//  MoviesListViewModel.swift
//  moviesapp
//
//  Created by Michael Mathews on 10/04/22.
//

import Foundation

class MoviesListViewModel: ObservableObject {
    
    @Published var movies = [Movie]()
    @Published var actualPage = 1
    @Published var totalPages = 0
    @Published var nextDisabled = true
    @Published var prevDisabled = true
    @Published var isLoading = true
    
    var manager: MoviesManager
        
    init(){
        self.manager = MoviesManager()
        self.getMovies()
    }
        
    func getMovies() {
        
        self.isLoading = true
        
        self.manager.getPaginatedMovies(page: self.actualPage) { movies in
            DispatchQueue.main.async {
                self.movies = movies.list
                self.totalPages = movies.totalPages
                    
                print("Total pages: \(self.totalPages)")
                    
                self.nextDisabled = false
                self.prevDisabled = false
                    
                if (self.actualPage >= self.totalPages) {
                    self.nextDisabled = true
                }
                    
                if (self.actualPage <= 1 ) {
                    self.prevDisabled = true
                }
                    
                self.isLoading = false
            }
        }
        
    }
    
    func nextPage(){
        if(self.actualPage < self.totalPages) {
            self.actualPage += 1
            self.getMovies()
        }
    }
    
    func prevPage(){
        if(self.actualPage > 1) {
            self.actualPage -= 1
            self.getMovies()
        }
    }
}
