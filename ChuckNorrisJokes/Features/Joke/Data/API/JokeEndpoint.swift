//
//  JokeEndpoint.swift
//  ChuckNorrisJokes
//
//  Created by MacBookPro on 27/09/26.
//

import Foundation

enum JokeEndpoint{
    static func random() -> Endpoint{
        Endpoint(path: "jokes/random")
    }
    
    static func random(category:String)-> Endpoint{
        Endpoint(
            path: "jokes/random",
            queryItems: [URLQueryItem(name: "category", value: category)]
        )
    }
    
    static func categories()-> Endpoint{
        Endpoint(path: "jokes/categories")
    }
}
