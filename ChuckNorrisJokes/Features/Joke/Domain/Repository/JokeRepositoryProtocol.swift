//
//  JokeRepositoryProtocol.swift
//  ChuckNorrisJokes
//
//  Created by MacBookPro on 27/09/26.
//

protocol JokeRepositoryProtocol{
    func getRandomJoke(category:String?) async -> Result<Joke, AppError>
    func getCategories() async -> Result<[String], AppError>
}
