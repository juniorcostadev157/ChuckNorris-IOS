//
//  Endpoint.swift
//  ChuckNorrisJokes
//
//  Created by MacBookPro on 27/09/26.
//

import Foundation

struct Endpoint{
    let path:String
    var method: HTTPMethod = .get
    var queryItems: [URLQueryItem] = []
}
