//
//  NetworkError.swift
//  Tmdb
//
//  Created by Mukul Jangir on 05/06/22.
//

import Foundation

enum NetworkError: Error {
    case apiError
    case cannotDecodeJson
    case noData
}
