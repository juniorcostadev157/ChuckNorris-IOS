//
//  PreviewJokeRepository.swift
//  ChuckNorrisJokes
//
//  Created by MacBookPro on 27/09/26.
//

struct PreviewJokeRepository: JokeRepositoryProtocol {
    var jokeResult: Result<Joke, AppError> = .success(.preview)

    func getRandomJoke(category: String?) async -> Result<Joke, AppError> {
        jokeResult
    }

    func getCategories() async -> Result<[String], AppError> {
        .success(["dev", "movie", "food"])
    }
}
