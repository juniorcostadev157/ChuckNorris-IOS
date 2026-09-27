//
//  JokeDTO.swift
//  ChuckNorrisJokes
//
//  Created by MacBookPro on 27/09/26.
//

struct JokeDTO: Decodable{
    let id: String
    let value: String
    let url: String
    let iconUrl:String?
    let categories: [String]
    let createdAt:String?
}
