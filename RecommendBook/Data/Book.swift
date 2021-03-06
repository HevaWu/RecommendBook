//
//  Book.swift
//  RecommendBook
//
//  Created by He Wu on 2020/07/10.
//  Copyright © 2020 He Wu. All rights reserved.
//
    

import Foundation

struct Book: Identifiable {
    var id = UUID()
    
    let title: String
    let relation: String
    
    init(rel: BookRelation) {
        self.title = rel.target
        self.relation = rel.reltype
    }
}
