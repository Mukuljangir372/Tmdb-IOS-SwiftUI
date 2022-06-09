//
//  TmdbEndpoints.swift
//  Tmdb
//
//  Created by Mukul Jangir on 05/06/22.
//

import Foundation

class TmdbEndpoints {
    
    static var shared = TmdbEndpoints()
    private init() { }
    
    let baseUrl = "https://api.themoviedb.org/3/movie/"
    let image500Url = "https://image.tmdb.org/t/p/w500"
    let apiKey = "api_key"
    let apiKeyValue = "1d08deb03dace3c2750c38a02e1525f8"
}
