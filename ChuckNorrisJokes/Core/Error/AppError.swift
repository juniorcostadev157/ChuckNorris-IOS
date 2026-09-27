//
//  AppError.swift
//  ChuckNorrisJokes
//
//  Created by MacBookPro on 27/09/26.
//

enum AppError: Error, Equatable{
    case network
    case notFound
    case server(code: Int)
    case unknown(message:String?)
}
