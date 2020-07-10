//
//  BookRelationFinder.swift
//  RecommendBook
//
//  Created by He Wu on 2020/07/10.
//  Copyright © 2020 He Wu. All rights reserved.
//
    

import Foundation

final class BookRelationFinder: ObservableObject {
    
    @Published var booksData: [Book] = []
    
    func findRelatedBooks(title: String, completion: ((Result<[Book], APIError>) -> Void)? = nil) {
        APIClient.shared.send(request: GetRelationBookListRequest(title: title)) { [unowned self] res in
            switch res {
            case let .success(data):
                let books = data.map { Book(rel: $0) }
                completion?(.success(books))
                print(books.count)
                DispatchQueue.main.async {
                    self.booksData = books
                }
            case let .failure(error):
                completion?(.failure(error))
            }
        }
    }
}
