//
//  HomeCollectionViewCell.swift
//  InOffice
//
//  Created by Luka Muše on 14.02.2022..
//

import UIKit

class LunchCollectionViewCell: UICollectionViewCell {

    static let identifier = "LunchCollectionViewCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Lunch for today"
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()

    private lazy var imageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "lunch"))
        image.layer.cornerRadius = 15
        return image
    }()

    private lazy var button: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .white
        btn.layer.borderWidth = 1.5
        btn.layer.borderColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1).cgColor
        btn.setTitle("      Vote      ", for: .normal)
        btn.layer.cornerRadius = 5
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()

    func setupCell() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 15
        contentView.addSubview(titleLabel)
        contentView.addSubview(imageView)
        contentView.addSubview(button)
    }

    func setupViews() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.top.equalTo(20)
        }
        imageView.snp.makeConstraints { make in
            make.trailing.equalTo(contentView).offset(-10)
            make.bottom.equalTo(contentView).offset(-10)
        }
        button.snp.makeConstraints { make in
            make.leading.equalTo(contentView).offset(28)
            make.bottom.equalTo(contentView).offset(-20)
        }
    }
}
