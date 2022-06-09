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
    let release_date: String?
    let vote_average: Double?
    
    var titleText: String {
        title ?? ""
    }
    var overviewText: String {
        overview ?? ""
    }
    var releaseDateText: String {
        release_date ?? ""
    }
    var rating: Int {
        guard let rate = vote_average else {
            return 0
        }
        return Int(rate / 2)
    }
    
    var posterUrl: URL? {
        guard let url = poster_path else {
            return nil
        }
        return URL(string: "\(TmdbEndpoints.shared.image500Url)\(url)")
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

