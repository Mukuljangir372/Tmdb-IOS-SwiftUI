//
//  NetworkMovie.swift
//  Tmdb
//
//  Created by Mukul Jangir on 05/06/22.
//

import Foundation

struct NetworkMovie: Codable{
    let id: Int
    let title: String?
    let overview: String?
    let poster_path: String?
    
    var titleText: String {
        title ?? ""
    }
    
    var overviewText: String {
        overview ?? ""
    }
    
    var posterUrl: URL? {
        guard let url = poster_path else {
            return nil
        }
        return URL(string: "https://image.tmdb.org/t/p/w500\(url)")
    }
}

struct NetworkMovies : Codable{
    let results: [NetworkMovie]
}

extension NetworkMovie {
    static var previewData: [NetworkMovie] {
        guard let url = Bundle.main.url(forResource: "movie_list", withExtension: "json") else {
            return []
        }
        let data = try? Data(contentsOf: url)
        let jsonDecorder = Utils.jsonDecorder
        let decodeModel = try? jsonDecorder.decode(NetworkMovies.self, from: data!)
        return decodeModel?.results ?? []
    }
}

