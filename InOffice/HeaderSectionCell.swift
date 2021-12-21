//
//  HeaderSectionCell.swift
//  InOffice
//
//  Created by Luka Muše on 10.12.2021..
//

import UIKit

class HeaderSectionCell: UITableViewHeaderFooterView {
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        return label
    }()

    private var view: UIView = {
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
            make.top.equalTo(snp.top)
            make.bottom.equalTo(snp.bottom)
            make.trailing.equalTo(snp.trailing)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(5)
            make.centerX.equalTo(view)
        }
    }

    func setData(title: String) {
        titleLabel.text = title
    }
}
