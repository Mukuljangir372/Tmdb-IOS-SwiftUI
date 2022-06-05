//
//  NetworkResult.swift
//  Tmdb
//
//  Created by Mukul Jangir on 05/06/22.
//

import Foundation

enum NetworkResult<T>{
    case idle
    case loading
    case failure(NetworkError)
    case success(T)
}
