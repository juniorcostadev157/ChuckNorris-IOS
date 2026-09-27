//
//  AppContainer.swift
//  ChuckNorrisJokes
//
//  Created by MacBookPro on 27/09/26.
//

import Foundation

/// Composition Root: dependências compartilhadas + containers das features.
@MainActor
final class AppContainer {

    // MARK: - Compartilhado (≈ networkModule)

    private let apiClient: any APIClientProtocol = APIClient(
        baseUrl: URL(string: "https://api.chucknorris.io")!
    )

    // MARK: - Features (≈ modules(listUserModule, ...))

    lazy var jokeContainer = JokeDIContainer(apiClient: apiClient)
}
