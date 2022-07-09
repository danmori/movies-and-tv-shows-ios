//
//  HomeScreenView.swift
//  Movies and TV Shows
//
//  Created by Dan Mori on 08/07/22.
//

import UIKit

class HomeScreenView: UIView {
    
    lazy var categoriesTitleLabel: PaddingLabel = PaddingLabel(frame: .zero)
    lazy var categoriesCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    lazy var featuredCollectionView: UICollectionView = UICollectionView()
    lazy var latestUpdatesTableView: UITableView = UITableView()
    var flowLayout: UICollectionViewFlowLayout {
        let _flowLayout = UICollectionViewFlowLayout()

        _flowLayout.itemSize = CGSize(width: 80, height: 40)
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
    }
    
    private func setupContentView() {
        backgroundColor = .white
    }
    
    private func setupCategoriesCollectionViewBlock() {
        categoriesTitleLabel.text = "Categories"
        categoriesTitleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        categoriesTitleLabel.padding(20, 0, 0, 0)
        
        categoriesCollectionView.register(LeftIconAndTitleCollectionViewCell.self, forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        categoriesCollectionView.showsHorizontalScrollIndicator = false
        categoriesCollectionView.showsVerticalScrollIndicator = false
        categoriesCollectionView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let stackCategories = UIStackView()
        stackCategories.addArrangedSubview(categoriesTitleLabel)
        stackCategories.layoutMargins = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 0.0)
        stackCategories.isLayoutMarginsRelativeArrangement = true
        
        let stack = UIStackView(arrangedSubviews: [stackCategories, categoriesCollectionView])
        stack.distribution = .fill
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)
        stack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    private func setupFeaturedCollectionViewBlock() {
        
    }
    
    
}
