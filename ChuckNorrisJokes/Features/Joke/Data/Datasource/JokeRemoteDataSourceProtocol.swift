//
//  JokeRemoteDataSourceProtocol.swift
//  ChuckNorrisJokes
//
//  Created by MacBookPro on 27/09/26.
//

protocol JokeRemoteDataSourceProtocol {
    func fetchRandomJoke(category:String?)async throws -> JokeDTO
    func fetchCategories()async throws -> [String]
}
