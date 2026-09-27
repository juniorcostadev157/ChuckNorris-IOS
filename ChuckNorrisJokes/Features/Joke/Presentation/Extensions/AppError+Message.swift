//
//  AppError+Message.swift
//  ChuckNorrisJokes
//
//  Created by MacBookPro on 27/09/26.
//

extension AppError {
    var userMessage: String {
        switch self {
        case .network:          "Sem conexão com a internet. Tente de novo."
        case .notFound:         "Nenhuma piada encontrada."
        case .server(let code): "Erro no servidor (\(code)). Tente mais tarde."
        case .unknown:          "Algo deu errado. Tente de novo."
        }
    }
}
