//
//  ChuckNorrisJokesApp.swift
//  ChuckNorrisJokes
//
//  Created by MacBookPro on 27/09/26.
//

import SwiftUI

@main
struct ChuckNorrisJokesApp: App {
    private let container = AppContainer()

    var body: some Scene {
        WindowGroup {
            container.jokeContainer.makeJokeView()
        }
    }
}
