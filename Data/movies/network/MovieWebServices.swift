//
//  MovieWebServices.swift
//  Tmdb
//
//  Created by Mukul Jangir on 05/06/22.
//

import Foundation

class MovieWebService {
    
    static let shared = MovieWebService()
    private let webService = TmdbWebService.shared
    
    private init() {}

    func getMovies(category: MovieCategory = .Popular,
                   dispatchQueue: DispatchQueue = .main,
                   completion: @escaping (NetworkResult<NetworkMovies>) -> ()
    ) async {
        let response = await webService.fetch(endpoint: "popular") as NetworkResult<NetworkMovies>
        dispatchQueue.async {
           completion(response)
        }
    }
}
