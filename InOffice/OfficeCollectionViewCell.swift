//
//  OfficeCollectionViewCell.swift
//  InOffice
//
//  Created by Luka Muše on 15.02.2022..
//

import UIKit

class OfficeCollectionViewCell: UICollectionViewCell {

    static let identifier = "OfficeCollectionViewCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell() {
        contentView.backgroundColor = .red
        contentView.layer.cornerRadius = 20
    }
}
