//
//  Joke.swift
//  ChuckNorrisJokes
//
//  Created by MacBookPro on 27/09/26.
//

import Foundation

struct Joke: Identifiable, Equatable {
    let id: String
    let text:String
    let url: URL?
    let iconURL: URL?
    let categories: [String]
}
