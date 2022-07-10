//
//  Content.swift
//  Movies and TV Shows
//
//  Created by Dan Mori on 09/07/22.
//

import Foundation

struct Content {
    let featuredImageName: String
    let name: String
    let shortDescription: String
    let category: Category
}

extension Content {
    static var featuredContent: [Content] {
        let actionCategory = Category(name: "Action", iconName: "")
        return [Content(featuredImageName: "movie.batman.featured", name: "Batman", shortDescription: "", category: actionCategory),
                Content(featuredImageName: "movie.theflash.featured", name: "The Flash", shortDescription: "", category: actionCategory)
        ]
    }
    
    static var allContent: [Content] {
        return []
    }
}
