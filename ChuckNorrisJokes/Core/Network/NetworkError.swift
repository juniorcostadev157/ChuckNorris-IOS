//
//  NetworkError.swift
//  ChuckNorrisJokes
//
//  Created by MacBookPro on 27/09/26.
//

enum NetworkError:Error{
    case invalidUrl
    case invalidResponse
    case noConnection
    case httpStatus(code: Int)
    case decoding(Error)
}
