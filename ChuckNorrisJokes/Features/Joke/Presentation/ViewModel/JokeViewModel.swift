//
//  JokeViewModel.swift
//  ChuckNorrisJokes
//
//  Created by MacBookPro on 27/09/26.
//

import Foundation
import Observation


@MainActor
@Observable
final class JokeViewModel{
    
    enum State: Equatable{
        case idle
        case loading
        case loaded(Joke)
        case failed(message:String)
    }
    
    
    private(set) var state: State = .idle
    private(set) var categories: [String] = []
    var selectedCategory: String?
    
    private let getRandomJoke: GetRandomJokeUseCase
    private let getCategories: GetCategoriesUseCase
    private var loadTask: Task<Void, Never>?
    
    
    init (getRandomJoke: GetRandomJokeUseCase, getCategories: GetCategoriesUseCase){
        self.getRandomJoke = getRandomJoke
        self.getCategories = getCategories
    }
    
    func onAppear()async{
        guard state == .idle else {return}
        await loadCategories()
        await fetchJoke()
    }
    
    func newJokeTapped(){
        loadTask?.cancel()
        loadTask = Task{await fetchJoke()}
    }
    
    private func fetchJoke() async{
        state = .loading
        
        let result  = await getRandomJoke(category: selectedCategory)
        guard !Task.isCancelled else {return}
        
        switch result{
        case .success(let joke):
            state = .loaded(joke)
        case .failure(let error):
            state = .failed(message: error.userMessage)
        }
    }
    
    
    private func loadCategories()async{
        if case .success(let list) = await getCategories(){
            categories = list
        }
    }
}
