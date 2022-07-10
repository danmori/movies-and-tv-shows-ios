//
//  FeaturedImageAndTitleCollectionViewCell.swift
//  Movies and TV Shows
//
//  Created by Dan Mori on 09/07/22.
//

import UIKit

class FeaturedImageAndTitleCollectionViewCell: UICollectionViewCell {
    
    lazy var featuredImageView: UIImageView = UIImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        featuredImageView.translatesAutoresizingMaskIntoConstraints = false
        featuredImageView.layer.cornerRadius = 10
        featuredImageView.layer.masksToBounds = true
        featuredImageView.contentMode = .scaleAspectFill
        
        addSubview(featuredImageView)
        featuredImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        featuredImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        featuredImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        featuredImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
