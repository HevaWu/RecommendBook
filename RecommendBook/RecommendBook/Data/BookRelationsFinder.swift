//
//  BookRelationFinder.swift
//  RecommendBook
//
//  Created by He Wu on 2020/07/10.
//  Copyright © 2020 He Wu. All rights reserved.
//
    

import Foundation

final class BookRelationFinder {
    enum FinderError: Error {
        case apiError(APIError)
    }
    
    let title: String
    init(title: String) {
        self.title = title
    }
    
    func findRelatedBooks(completion: @escaping (Result<[Book], FinderError>) -> Void) {
        APIClient.shared.send(request: GetRelationBookListRequest(title: title)) { res in
            switch res {
            case let .success(data):
                let books = data.map { Book(rel: $0) }
                completion(.success(books))
            case let .failure(error):
                completion(.failure(.apiError(error)))
            }
        }
    }
}
