//
//  CategoriesDataSource.swift
//  Movies and TV Shows
//
//  Created by Dan Mori on 09/07/22.
//

import UIKit

class GenericCollectionViewDataSource<Cell: UICollectionViewCell, T>: NSObject, UICollectionViewDataSource {
    private var cellIdentifier: String!
    private var items: [T]!
    var configureCell: (Cell, T) -> () = {_, _ in }
    
    init(cellIdentifier : String, items : [T], configureCell : @escaping (Cell, T) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! Cell
        let item = items[indexPath.item]
        self.configureCell(cell, item)
        return cell
    }
}
