//
//  MovieListState.swift
//  Tmdb
//
//  Created by Mukul Jangir on 05/06/22.
//

import Foundation

@MainActor
class MovieListState: ObservableObject {
    
    private var service: MovieWebService?
    
    @Published var movieNetworkResult: NetworkResult<NetworkMovies> = NetworkResult.idle
    
    init(service: MovieWebService = MovieWebService.shared) {
        self.service = service
    }
    
    func getMovies() async {
        await service?.getMovies { result in
            self.movieNetworkResult = result
        }
    }
    
}
