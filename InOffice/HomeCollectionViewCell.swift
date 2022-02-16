//
//  HomeCollectionViewCell.swift
//  InOffice
//
//  Created by Luka Muše on 14.02.2022..
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    static let identifier = "HomeCollectionViewCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell() {
        contentView.backgroundColor = .blue
        contentView.layer.cornerRadius = 15
    }
}
