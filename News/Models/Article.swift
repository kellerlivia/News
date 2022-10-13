//
//  Article.swift
//  News
//
//  Created by Livia Carvalho Keller on 12/10/22.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}
