//
//  Category.swift
//  Movies and TV Shows
//
//  Created by Dan Mori on 08/07/22.
//

import Foundation

struct Category {
    let name: String
    let iconName: String
}

extension Category {
    static var sampleData: [Category] {
        return [
            Category(name: "Action", iconName: ""),
            Category(name: "Comedy", iconName: ""),
            Category(name: "Romance", iconName: ""),
            Category(name: "Horror", iconName: ""),
            Category(name: "Suspense", iconName: ""),
            Category(name: "Sci-fi", iconName: ""),
            Category(name: "Classic", iconName: ""),
        ]
    }
}
