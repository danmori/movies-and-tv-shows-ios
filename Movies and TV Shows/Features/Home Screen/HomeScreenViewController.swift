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
    private var categoriesDataSource : GenericCollectionViewDataSource<LeftIconAndTitleCollectionViewCell, Category>!
    private var featuredContentDataSource: GenericCollectionViewDataSource<FeaturedImageAndTitleCollectionViewCell, Content>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        updateDataSources()
        setupBinders()
        loadCategories()
        loadFeatured()
    }
    
    override func loadView() {
        self.view = contentView
    }
    
    private func setupDelegates() {
        self.contentView.categoriesCollectionView.delegate = self
        self.contentView.featuredCollectionView.delegate = self
    }
    
    private func updateDataSources() {
        categoriesDataSource = GenericCollectionViewDataSource(cellIdentifier: "CategoryCollectionViewCell", items: self.viewModel.categories.value ?? [Category](), configureCell: { cell, item in
            cell.categoryName = item.name
        })
        
        contentView.categoriesCollectionView.dataSource = categoriesDataSource
        contentView.categoriesCollectionView.reloadData()
        
        featuredContentDataSource = GenericCollectionViewDataSource(cellIdentifier: "FeaturedImageAndTitleCollectionViewCell", items: viewModel.featuredContent.value ?? [Content](), configureCell: { cell, item in
            print("image name: \(item.featuredImageName)")
            cell.featuredImageView.image = UIImage(named: item.featuredImageName)
        })
        
        contentView.featuredCollectionView.dataSource = featuredContentDataSource
        contentView.featuredCollectionView.reloadData()
    }
    
    private func setupBinders() {
        viewModel.categories.bind { categories in
            DispatchQueue.main.async {
                self.updateDataSources()
            }
        }
        viewModel.featuredContent.bind { content in
            DispatchQueue.main.async {
                self.updateDataSources()
            }
        }
    }
    
    private func loadCategories() {
        viewModel.getCategories()
    }
    
    private func loadFeatured() {
        viewModel.getFeatured()
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

extension HomeScreenViewController: UICollectionViewDelegate {

}
