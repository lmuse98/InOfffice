//
//  CustomCell.swift
//  InOffice
//
//  Created by Luka Muše on 10.12.2021..
//

import Foundation
import UIKit

class UserCell: UITableViewCell {

    struct Constant {
        static let cellName = "UserCell"
    }

    private lazy var profilePic: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(profilePic)
        addSubview(stackView)
        stackView.addArrangedSubview(userNameLabel)
        stackView.addArrangedSubview(descriptionLabel)
    }

    private func setupConstraints() {
        profilePic.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.centerY.equalTo(self)
            make.width.height.equalTo(40)
        }

        stackView.snp.makeConstraints { make in
            make.leading.equalTo(profilePic.snp.trailing).offset(10)
            make.top.bottom.trailing.equalToSuperview().inset(10)
        }
    }

    func setData(_ user: User) {
        //profilePic.image = user.profilePic
        descriptionLabel.text = user.role 
        userNameLabel.text = user.name
    }
}
