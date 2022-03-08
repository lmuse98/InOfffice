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
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()

    private lazy var imageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "lunch2")?.withRenderingMode(.alwaysTemplate))
        image.tintColor = .white
        return image
    }()

    private lazy var button: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .systemGray5
        btn.layer.borderColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1).cgColor
        btn.setTitle("      Vote      ", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        btn.layer.cornerRadius = 6
        btn.setTitleColor(.init(red: 0.07, green: 0.05, blue: 0.26, alpha: 1.00), for: .normal)
        return btn
    }()

    private func setupCell() {
        contentView.backgroundColor = .init(red: 0.07, green: 0.05, blue: 0.26, alpha: 1.00)
        contentView.layer.cornerRadius = 15
        contentView.addSubview(titleLabel)
        contentView.addSubview(imageView)
        contentView.addSubview(button)
    }

    private func setupViews() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.top.equalTo(20)
        }
        imageView.snp.makeConstraints { make in
            make.trailing.equalTo(contentView).offset(-10)
            make.bottom.equalTo(contentView).offset(-5)
        }
        button.snp.makeConstraints { make in
            make.leading.equalTo(contentView).offset(30)
            make.bottom.equalTo(contentView).offset(-20)
        }
    }
}
