//
//  MoviesListViewModel.swift
//  moviesapp
//
//  Created by Michael Mathews on 10/04/22.
//

import Foundation
import Network

class MoviesListViewModel: ObservableObject {
    
    @Published var movies = [Movie]()
    @Published var localMovies = [MovieEntity]()
    @Published var actualPage = 1
    @Published var totalPages = 0
    @Published var nextDisabled = true
    @Published var prevDisabled = true
    @Published var isLoading = true
    @Published var isConnected = true
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "NetworkManager")
    
    var manager: MoviesManager
        
    init(){
        self.manager = MoviesManager()
        self.getMovies()
        
        self.monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        
        self.monitor.start(queue: self.queue)
    }
        
    func getMovies() {
        
        self.isLoading = true
        
        if isConnected {
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
        } else {
            print("Wifi is not connected, getting data from local")
            
            
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
