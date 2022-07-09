//
//  LeftIconAndTitleCollectionViewCell.swift
//  Movies and TV Shows
//
//  Created by Dan Mori on 09/07/22.
//

import UIKit

class LeftIconAndTitleCollectionViewCell: UICollectionViewCell {
    
    private lazy var pillOutline = UIView()
    private lazy var textLabel = UILabel(frame: .zero)
    var categoryName: String = "" {
        didSet {
            textLabel.text = categoryName
            textLabel.sizeToFit()
            textLabel.updateConstraintsIfNeeded()
            pillOutline.updateConstraintsIfNeeded()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        
        pillOutline.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(pillOutline)
        pillOutline.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        pillOutline.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        pillOutline.topAnchor.constraint(equalTo: topAnchor).isActive = true
        pillOutline.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        pillOutline.layoutIfNeeded()
        
        pillOutline.layer.borderColor = CGColor(gray: 0.7, alpha: 1.0)
        pillOutline.layer.cornerRadius = pillOutline.bounds.height / 2
        pillOutline.layer.borderWidth = 2
        
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.textAlignment = .center
        textLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        pillOutline.addSubview(textLabel)
        textLabel.leadingAnchor.constraint(equalTo: pillOutline.leadingAnchor).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: pillOutline.trailingAnchor).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
