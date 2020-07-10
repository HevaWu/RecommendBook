//
//  APIClient.swift
//  RecommendBook
//
//  Created by He Wu on 2020/07/10.
//  Copyright © 2020 He Wu. All rights reserved.
//
    

import Foundation

enum APIError: Error {
    case emptyData
    case decodeFailed
    case responseError(Error)
}

final class APIClient {
    static let shared = APIClient()
    
    func send<R: Request>(request: R, completion: @escaping (Result<R.Response, APIError>) -> Void) {
        URLSession.shared.dataTask(with: request.generateURLRequest()) { data, response, error in
            if let error = error {
                completion(.failure(.responseError(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.emptyData))
                return
            }
            
            guard let res = try? JSONDecoder().decode(R.Response.self, from: data) else {
                completion(.failure(.decodeFailed))
                return
            }
            
            completion(.success(res))
        }
    }
}
