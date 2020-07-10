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
    var queryParams: [String: String]? { get }
}

extension Request {
    func generateURLRequest() -> URLRequest {
        var components: URLComponents = component
        components.path = path
        if let query = queryParams, !query.isEmpty {
//            let _queryStr = Self.string(from: query)
            components.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value)}
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
    
    var queryParams: [String: String]? {
        return ["q": title]
    }
    
    var method: String = "GET"
    
    var component: URLComponents {
        var component = URLComponents()
        component.scheme = "http"
        component.host = "10.231.183.231"
        component.port = 8444
        return component
    }
    let path: String = "/map"

    let title: String
    
    init(title: String) {
        self.title = title
    }
}
