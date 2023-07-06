//
//  GridAnimationView.swift
//  Samurai
//
//  Created by newAccount on 06.07.2023.
//

import UIKit

class GridAnimationView: UICollectionViewCell {
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}

