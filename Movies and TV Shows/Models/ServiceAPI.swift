//
//  ServiceAPI.swift
//  Movies and TV Shows
//
//  Created by Dan Mori on 08/07/22.
//

import Foundation

protocol ServiceProvider {
    func getCategories(completion: @escaping (_ categotories: [Category]) -> Void)
}

struct ServiceAPI: ServiceProvider {
    func getCategories(completion: @escaping ([Category]) -> Void) {
        completion(Category.sampleData)
    }
}
