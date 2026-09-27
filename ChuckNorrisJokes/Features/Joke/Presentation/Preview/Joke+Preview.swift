//
//  Joke+Preview.swift
//  ChuckNorrisJokes
//
//  Created by MacBookPro on 27/09/26.
//

import Foundation

extension Joke {
    static let preview = Joke(
        id: "preview-1",
        text: "Chuck Norris can divide by zero.",
        url: nil,
        iconURL: URL(string: "https://api.chucknorris.io/img/avatar/chuck-norris.png"),
        categories: ["dev"]
    )
}
