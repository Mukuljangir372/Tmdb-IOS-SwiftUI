//
//  TmdbWebService.swift
//  Tmdb
//
//  Created by Mukul Jangir on 05/06/22.
//

import Foundation

class TmdbWebService {
    
    static var shared = TmdbWebService()
    
    private let endpoints = TmdbEndpoints.shared
    private let session = URLSession.shared
    private let jsonDecorder = JSONDecoder()
    
    private init() {}
    
    func getEndpoints() -> TmdbEndpoints {
        return endpoints
    }
    
    func fetch<T: Codable>(endpoint: String) async -> NetworkResult<T>{
        let urlComponents = NSURLComponents(string: "\(endpoints.baseUrl + endpoint)")!
        urlComponents.queryItems = [
            URLQueryItem(name: endpoints.apiKey,value: String(endpoints.apiKeyValue))
        ]
        let request = URLRequest(url: urlComponents.url!)
        do {
            let (networkData, _) = try await session.data(for: request)
            let jsonResponse = try? jsonDecorder.decode(T.self, from: networkData)
            if let decodedResponse = jsonResponse {
                log(msg: "success")
                return .success(decodedResponse)
            }else {
                log(msg: "cannotDecodeJson")
                return .failure(.cannotDecodeJson)
            }
        }catch{
            log(msg: "\(error.localizedDescription)")
            return .failure(.apiError)
        }
    }
    
    private func log(msg: String) {
        print("TmdbWebService: \(msg)")
    }

}
