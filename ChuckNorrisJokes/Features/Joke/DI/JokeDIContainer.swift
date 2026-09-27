//
//  JokeDIContainer.swift
//  ChuckNorrisJokes
//
//  Created by MacBookPro on 27/09/26.
//

import Foundation

/// Container de dependências da feature Joke (≈ listUserModule do Koin).
@MainActor
final class JokeDIContainer {

    // Dependência que vem de fora (≈ get<NetworkClient>())
    private let apiClient: any APIClientProtocol

    init(apiClient: any APIClientProtocol) {
        self.apiClient = apiClient
    }

    // MARK: - Data (≈ single)

    private lazy var remoteDataSource: any JokeRemoteDataSourceProtocol =
        JokeRemoteDataSourceImpl(client: apiClient)

    private lazy var repository: any JokeRepositoryProtocol =
        JokeRepositoryImpl(remoteDataSource: remoteDataSource)

    // MARK: - Domain (≈ factory)

    private func makeGetRandomJokeUseCase() -> GetRandomJokeUseCase {
        GetRandomJokeUseCase(repository: repository)
    }

    private func makeGetCategoriesUseCase() -> GetCategoriesUseCase {
        GetCategoriesUseCase(repository: repository)
    }

    // MARK: - Presentation (≈ viewModel { })

    func makeJokeViewModel() -> JokeViewModel {
        JokeViewModel(
            getRandomJoke: makeGetRandomJokeUseCase(),
            getCategories: makeGetCategoriesUseCase()
        )
    }

    func makeJokeView() -> JokeView {
        JokeView(viewModel: makeJokeViewModel())
    }
}
