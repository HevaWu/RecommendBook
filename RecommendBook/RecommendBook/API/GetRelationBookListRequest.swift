//
//  GetRelationBookListRequest.swift
//  RecommendBook
//
//  Created by He Wu on 2020/07/10.
//  Copyright © 2020 He Wu. All rights reserved.
//
    
import Foundation

protocol Request {
    associatedtype Response: Decodable
    
    var method: String { set get }
    var path: String { get }
    var component: URLComponents { get }
    var queryParams: [String: Any]? { get }
}

extension Request {
    func generateURLRequest() -> URLRequest {
        var components: URLComponents = component
        components.path = path
        if let query = queryParams, !query.isEmpty {
            components.percentEncodedQuery = Self.string(from: query)
        }
        
        var urlRequest = URLRequest(url: components.url!)
        urlRequest.httpMethod = method
        return urlRequest
    }
    
    public static func string(from dic: [String: Any]) -> String {
        let pairs = dic.map { key, val -> String in
            return "\(key)=\(val)"
        }
        return pairs.joined(separator: "&")
    }
}

// http://10.231.183.231:8444/map?q=バカ
final class GetRelationBookListRequest: Request {
    
    typealias Response = [BookRelation]
    
    var queryParams: [String: Any]? {
        return ["q": title]
    }
    
    var method: String = "GET"
    
    var component: URLComponents {
        var component = URLComponents()
        component.scheme = "http:"
        component.host = "10.231.183.231:8444"
        return component
    }
    let path: String = "/map"

    let title: String
    
    init(title: String) {
        self.title = title
    }
}
