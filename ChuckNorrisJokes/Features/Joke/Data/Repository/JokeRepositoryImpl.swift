//
//  JokeRepositoryImpl.swift
//  ChuckNorrisJokes
//
//  Created by MacBookPro on 27/09/26.
//

import Foundation

final class JokeRepositoryImpl: JokeRepositoryProtocol{
    private let remoteDataSource: any JokeRemoteDataSourceProtocol
    
    init(remoteDataSource: any JokeRemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getCategories() async -> Result<[String], AppError> {
        do {
            let categories = try await remoteDataSource.fetchCategories()
            return .success(categories)
        }catch{
            return .failure(mapError(error: error))
        }
    }
    
    
    func getRandomJoke(category: String?) async -> Result<Joke, AppError> {
        do {
            let dto = try await remoteDataSource.fetchRandomJoke(category: category)
            return .success(dto.toDomain())
        }catch{
            return .failure(mapError(error: error))
        }
    }
    
    private func mapError(error: Error)-> AppError{
        guard let networkError = error as? NetworkError else{
            return .unknown(message: error.localizedDescription)
        }
        
        switch networkError{
            
        case .noConnection:
            return .network
        case .httpStatus(code: let code) where code == 404:
            return .notFound
        case .httpStatus(code: let code):
            return .server(code: code)
        case .invalidUrl, .invalidResponse, .decoding:
            return .unknown(message: "\(networkError)")
            
        }
    }
    

}
