//
//  HomeScreenView.swift
//  Movies and TV Shows
//
//  Created by Dan Mori on 08/07/22.
//

import UIKit

class HomeScreenView: UIView {
    
    lazy var categoriesTitleLabel: UILabel = UILabel(frame: .zero)
    lazy var featuredTitleLabel: UILabel = UILabel(frame: .zero)
    lazy var allContentLabel: UILabel = UILabel(frame: .zero)
    lazy var categoriesCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    lazy var featuredCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: featuredFlowLayout)
    lazy var allContentTableView: UITableView = UITableView(frame: .zero, style: .plain)
    var flowLayout: UICollectionViewFlowLayout {
        let _flowLayout = UICollectionViewFlowLayout()

        _flowLayout.itemSize = CGSize(width: 80, height: 40)
        _flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        _flowLayout.scrollDirection = .horizontal
        _flowLayout.minimumInteritemSpacing = 5.0
        
        return _flowLayout
    }
    var featuredFlowLayout: UICollectionViewFlowLayout {
        let _flowLayout = UICollectionViewFlowLayout()

        _flowLayout.itemSize = CGSize(width: 250, height: 150)
        _flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        _flowLayout.scrollDirection = .horizontal
        _flowLayout.minimumInteritemSpacing = 5.0
        
        return _flowLayout
    }

    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupViews() {
        setupContentView()
        setupCategoriesCollectionViewBlock()
        setupFeaturedCollectionViewBlock()
        setupAllContentCollectionViewBlock()
        setupStacks()
    }
    
    private func setupContentView() {
        backgroundColor = .white
    }
    
    private func setupCategoriesCollectionViewBlock() {
        categoriesTitleLabel.text = "Categories"
        categoriesTitleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        categoriesCollectionView.register(LeftIconAndTitleCollectionViewCell.self, forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        categoriesCollectionView.showsHorizontalScrollIndicator = false
        categoriesCollectionView.showsVerticalScrollIndicator = false
        categoriesCollectionView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func setupFeaturedCollectionViewBlock() {
        featuredTitleLabel.text = "Featured"
        featuredTitleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        featuredCollectionView.register(FeaturedImageAndTitleCollectionViewCell.self, forCellWithReuseIdentifier: "FeaturedImageAndTitleCollectionViewCell")
        featuredCollectionView.showsHorizontalScrollIndicator = false
        featuredCollectionView.showsVerticalScrollIndicator = false
        featuredCollectionView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    private func setupAllContentCollectionViewBlock() {
        allContentLabel.text = "All Content"
        allContentLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        allContentTableView.register(ContentTableViewCell.self, forCellReuseIdentifier: "ContentTableViewCell")
        allContentTableView.showsHorizontalScrollIndicator = false
        allContentTableView.showsVerticalScrollIndicator = false
        allContentTableView.rowHeight = 40.0
        allContentTableView.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }
    
    private func setupStacks() {
        let stackCategories = UIStackView()
        stackCategories.addArrangedSubview(categoriesTitleLabel)
        stackCategories.layoutMargins = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 0.0)
        stackCategories.isLayoutMarginsRelativeArrangement = true
        
        let stackFeatured = UIStackView()
        stackFeatured.addArrangedSubview(featuredTitleLabel)
        stackFeatured.layoutMargins = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 0.0)
        stackFeatured.isLayoutMarginsRelativeArrangement = true
        
        let stackAllContent = UIStackView()
        stackAllContent.addArrangedSubview(allContentLabel)
        stackAllContent.layoutMargins = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 0.0)
        stackAllContent.isLayoutMarginsRelativeArrangement = true
        
        let stack = UIStackView(arrangedSubviews: [stackCategories, categoriesCollectionView,
                                                   stackFeatured, featuredCollectionView,
                                                   stackAllContent, allContentTableView
                                                  ])
        
        stack.setCustomSpacing(20, after: categoriesCollectionView)
        stack.setCustomSpacing(20, after: featuredCollectionView)
        
        stack.distribution = .fill
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)
        stack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
}
