//
//  HomeScreenViewModel.swift
//  Movies and TV Shows
//
//  Created by Dan Mori on 08/07/22.
//

import Foundation
import UIKit

class HomeScreenViewModel: NSObject {
    
    var service: ServiceProvider
    
    init(service: ServiceProvider) {
        self.service = service
    }
    
    var categories = Bindable<[Category]>()
    var featuredContent = Bindable<[Content]>()
    
    func getCategories() {
        service.getCategories {
            self.categories.value = $0
        }
    }
    
    func getFeatured() {
        service.getFeaturedContent {
            self.featuredContent.value = $0
        }
    }
    
    func numberOfItems(forCollectionView collectionView: UICollectionView, andView view: HomeScreenView) -> Int {
        if collectionView == view.categoriesCollectionView {
            return categories.value?.count ?? 0
        } else if collectionView == view.featuredCollectionView {
            return featuredContent.value?.count ?? 0
        }
            
        return 0
    }
    
}
