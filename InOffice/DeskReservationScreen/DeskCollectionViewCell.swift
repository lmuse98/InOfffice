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
        return label
    }()

    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.text = "SooooN"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    private lazy var imageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "desk"))
        return image
    }()

    func setupCell() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 15
    }

    func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(imageView)
        contentView.addSubview(secondLabel)
    }

    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.top.equalTo(20)
        }
        secondLabel.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.top.equalTo(50)
        }
        imageView.snp.makeConstraints { make in
            make.trailing.equalTo(contentView).offset(-15)
            make.bottom.equalTo(contentView).offset(-10)
        }
    }
}
