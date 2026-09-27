//
//  JokeMapper.swift
//  ChuckNorrisJokes
//
//  Created by MacBookPro on 27/09/26.
//
import Foundation

extension JokeDTO{
    func toDomain()-> Joke{
        Joke(
            id: id,
            text: value,
            url: URL(string: url),
            iconURL: iconUrl.flatMap{URL(string: $0)},
            categories: categories
        )
    }
}
