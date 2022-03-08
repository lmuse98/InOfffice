//
//  DeskCollectionViewCell.swift
//  InOffice
//
//  Created by Luka Muše on 01.03.2022..
//

import UIKit

class DeskCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DeskCollectionViewCell"

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
        label.text = "Get a desk for next day"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()

    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.text = "SooooN"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    private lazy var imageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "desk2")?.withRenderingMode(.alwaysTemplate))
        image.tintColor = .white
        return image
    }()

    private func setupCell() {
        contentView.backgroundColor = .init(red: 0.07, green: 0.05, blue: 0.26, alpha: 1.00)
        contentView.layer.cornerRadius = 15
    }

    private func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(imageView)
        contentView.addSubview(secondLabel)
    }

    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.top.equalTo(20)
        }
        secondLabel.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.top.equalTo(50)
        }
        imageView.snp.makeConstraints { make in
            make.trailing.equalTo(contentView).offset(-10)
            make.bottom.equalTo(contentView).offset(-5)
        }
    }
}
