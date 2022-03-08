//
//  HeaderSectionCell.swift
//  InOffice
//
//  Created by Luka Muše on 10.12.2021..
//

import UIKit

class HeaderSectionCell: UITableViewHeaderFooterView {

    struct Constant {
        static let cellName = "HeaderSectionCell"
    }

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 22)
        return label
    }()

    private lazy var view: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureView() {
        addSubview(view)
        addSubview(titleLabel)
    }

    private func setupConstraints() {
        view.snp.makeConstraints { make in
            make.leading.equalTo(snp.leading)
            make.top.equalToSuperview()
            make.bottom.equalTo(view)
            make.trailing.equalTo(snp.trailing)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(5)
            make.centerX.equalTo(view)
        }
    }

    func setData(title: String) {
        titleLabel.text = title
    }
}
