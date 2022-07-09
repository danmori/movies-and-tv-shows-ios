//
//  HomeScreenViewController.swift
//  Movies and TV Shows
//
//  Created by Dan Mori on 08/07/22.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    lazy var contentView = HomeScreenView()
    let service = ServiceAPI()
    lazy var viewModel = HomeScreenViewModel(service: service)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDataSourcesAndDelegates()
        setupBinders()
        loadCategories()
    }
    
    override func loadView() {
        self.view = contentView
    }
    
    private func setupDataSourcesAndDelegates() {
        contentView.categoriesCollectionView.dataSource = self
        contentView.categoriesCollectionView.delegate = self
    }
    
    private func setupBinders() {
        viewModel.categories.bind { categories in
            DispatchQueue.main.async {
                self.contentView.categoriesCollectionView.reloadData()
            }
        }
    }
    
    private func loadCategories() {
        viewModel.getCategories()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HomeScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems(forCollectionView: collectionView, andView: self.contentView)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == contentView.categoriesCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? LeftIconAndTitleCollectionViewCell else { return UICollectionViewCell() }
            cell.categoryName = viewModel.categories.value?[indexPath.item].name ?? ""
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == contentView.categoriesCollectionView {
            let item = viewModel.categories.value?[indexPath.item].name ?? ""
            return CGSize(width: item.size(withAttributes: nil).width + 25.0, height: 40)
        }
        return CGSize(width: 0, height: 0)
    }
    
}
