//
//  BookRelation.swift
//  RecommendBook
//
//  Created by He Wu on 2020/07/10.
//  Copyright © 2020 He Wu. All rights reserved.
//
    

import Foundation

struct BookRelation: Codable {
    let source: String
    let reltype: String
    let target: String
}
