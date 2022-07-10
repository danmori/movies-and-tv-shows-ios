//
//  ServiceAPI.swift
//  Movies and TV Shows
//
//  Created by Dan Mori on 08/07/22.
//

import Foundation

protocol ServiceProvider {
    func getCategories(completion: @escaping (_ categotories: [Category]) -> Void)
    func getFeaturedContent(completion: @escaping (_ categotories: [Content]) -> Void)
    func getAllContent(completion: @escaping (_ categotories: [Content]) -> Void)
}

struct ServiceAPI: ServiceProvider {
    func getCategories(completion: @escaping ([Category]) -> Void) {
        completion(Category.sampleData)
    }
    
    func getFeaturedContent(completion: @escaping ([Content]) -> Void) {
        completion(Content.featuredContent)
    }
    
    func getAllContent(completion: @escaping ([Content]) -> Void) {
        completion(Content.allContent)
    }
}
