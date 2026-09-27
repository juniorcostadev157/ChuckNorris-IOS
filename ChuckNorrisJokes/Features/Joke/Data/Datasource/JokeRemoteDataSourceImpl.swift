//
//  JokeRemoteDataSourceImpl.swift
//  ChuckNorrisJokes
//
//  Created by MacBookPro on 27/09/26.
//

final class JokeRemoteDataSourceImpl: JokeRemoteDataSourceProtocol{
    private let client: any APIClientProtocol
    
    init(client: any APIClientProtocol) {
        self.client = client
    }
    
    func fetchRandomJoke(category: String?) async throws -> JokeDTO {
        if let category{
            return try await client.request(JokeEndpoint.random(category: category))
        }
        return try await client.request(JokeEndpoint.random())
    }
    
    func fetchCategories() async throws -> [String] {
        try await client.request(JokeEndpoint.categories())
    }
    
    
}
