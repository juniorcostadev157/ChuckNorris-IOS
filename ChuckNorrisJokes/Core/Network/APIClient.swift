//
//  ApiClient.swift
//  ChuckNorrisJokes
//
//  Created by MacBookPro on 27/09/26.
//

import Foundation

protocol APIClientProtocol{
    func request<T: Decodable>(_ endpoint:Endpoint) async throws -> T
}

final class APIiClient: APIClientProtocol{
    private let baseUrl: URL
    private let session: URLSession
    private let decoder: JSONDecoder
    
    init(baseUrl: URL, session: URLSession = .shared) {
        self.baseUrl = baseUrl
        self.session = session
        self.decoder = JSONDecoder()
        self.decoder.keyDecodingStrategy = .convertFromSnakeCase
    }

    func request<T>(_ endpoint: Endpoint) async throws -> T where T : Decodable {
        //Montar URL
        var components = URLComponents(
            url: baseUrl.appending(path:endpoint.path),
            resolvingAgainstBaseURL: false
        )
        
        if !endpoint.queryItems.isEmpty{
            components?.queryItems = endpoint.queryItems
        }
        
        guard let url = components?.url else{
            throw NetworkError.invalidUrl
        }
        
        // Montar a requisição
        var request = URLRequest(url:url)
        request.httpMethod = endpoint.method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        //Chamar o servidor
        let result: (Data, URLResponse)
        
        do {
            result = try await session.data(for: request)
        }catch{
            throw NetworkError.noConnection
        }
        let (data, response) = result
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.httpStatus(code: httpResponse.statusCode)
        }
        
        do{
            return try decoder.decode(T.self, from: data)
        }catch{
            throw NetworkError.decoding(error)
        }
    }
    
    
}
