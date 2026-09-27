//
//  GetCategoriesUseCase.swift
//  ChuckNorrisJokes
//
//  Created by MacBookPro on 27/09/26.
//

struct GetCategoriesUseCase{
    private let repository: any JokeRepositoryProtocol
    
    init(repository: any JokeRepositoryProtocol) {
        self.repository = repository
    }
    
    func callAsFunction() async -> Result<[String], AppError>{
        await repository.getCategories()
    }
}
