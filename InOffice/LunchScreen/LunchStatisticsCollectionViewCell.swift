//
//  LunchStatisticsCollectionViewCell.swift
//  InOffice
//
//  Created by Luka Muše on 03.03.2022..
//

import UIKit

class LunchStatisticsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "LunchStatisticsCollectionViewCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Analitika"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()

    private lazy var imageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "stat1")?.withRenderingMode(.alwaysTemplate))
        image.tintColor = .systemGray2
        return image
    }()

    private func setupCell() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 15
    }

    private func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(imageView)
    }

    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.bottom.equalTo(-15)
            make.centerX.equalTo(contentView)
        }
    }
}
