//
//  DeskReservationsCollectionViewCell.swift
//  InOffice
//
//  Created by Luka Muše on 03.03.2022..
//

import UIKit

class DeskReservationsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DeskReservationsCollectionViewCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupCell()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Coming to office?"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()

    private lazy var imageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "stat1"))
        return image
    }()

    func setupCell() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 15
    }

    func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(imageView)
    }

    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.bottom.equalTo(1)
            make.centerX.equalTo(contentView)
        }
    }

}
