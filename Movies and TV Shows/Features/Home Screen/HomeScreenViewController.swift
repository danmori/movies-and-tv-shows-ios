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
    private var allContentDataSource: GenericTableViewDataSource<ContentTableViewCell, Content>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        updateCategoriesDataSources()
        updateFeaturedDataSource()
        updateAllContentDataSource()
        setupBinders()
        getCategories()
        getFeatured()
        getAllContent()
    }
    
    override func loadView() {
        self.view = contentView
    }
    
    private func setupDelegates() {
        self.contentView.categoriesCollectionView.delegate = self
        self.contentView.featuredCollectionView.delegate = self
        self.contentView.allContentTableView.delegate = self
    }
    
    private func updateCategoriesDataSources() {
        categoriesDataSource = GenericCollectionViewDataSource(cellIdentifier: "CategoryCollectionViewCell", items: self.viewModel.categories.value ?? [Category](), configureCell: { cell, item in
            cell.categoryName = item.name
        })
        
        contentView.categoriesCollectionView.dataSource = categoriesDataSource
        contentView.categoriesCollectionView.reloadData()
    }
    
    private func updateFeaturedDataSource() {
        featuredContentDataSource = GenericCollectionViewDataSource(cellIdentifier: "FeaturedImageAndTitleCollectionViewCell", items: viewModel.featuredContent.value ?? [Content](), configureCell: { cell, item in
            cell.featuredImageView.image = UIImage(named: item.featuredImageName)
        })
        
        contentView.featuredCollectionView.dataSource = featuredContentDataSource
        contentView.featuredCollectionView.reloadData()
    }
    
    private func updateAllContentDataSource() {
        allContentDataSource = GenericTableViewDataSource(cellIdentifier: "ContentTableViewCell", items: viewModel.allContent.value ?? [Content](), configureCell: { cell, item in
            cell.titleLabel.text = item.name
        })
        contentView.allContentTableView.dataSource = allContentDataSource
        contentView.allContentTableView.reloadData()
    }
    
    private func setupBinders() {
        viewModel.categories.bind { _ in
            DispatchQueue.main.async {
                self.updateCategoriesDataSources()
            }
        }
        viewModel.featuredContent.bind { _ in
            DispatchQueue.main.async {
                self.updateFeaturedDataSource()
            }
        }
        viewModel.allContent.bind { _ in
            DispatchQueue.main.async {
                self.updateAllContentDataSource()
            }
        }
    }
    
    private func getCategories() {
        viewModel.getCategories()
    }
    
    private func getFeatured() {
        viewModel.getFeatured()
    }
    
    private func getAllContent() {
        viewModel.getAllContent()
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

extension HomeScreenViewController: UITableViewDelegate {
    
}
