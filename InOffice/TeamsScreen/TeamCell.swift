//
//  TeamCell.swift
//  InOffice
//
//  Created by Luka Muše on 03.02.2022..
//

import UIKit

class TeamCell: UITableViewCell {

    struct Constant {
        static let cellName = "TeamCell"
    }

    private lazy var backView: UIView = {
        let backView = UIView()
        backView.layer.cornerRadius = 10
        backView.backgroundColor = .white
        return backView
    }()

    private lazy var nameTeamLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()

    private lazy var numberPeopleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .light)
        label.textColor = .systemGray2
        label.text = "People()"
        return label
    }()

    private lazy var avatarsPeople: UIImageView = {
        let avatars = UIImageView()
        return avatars
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        addSubview(backView)
        backView.addSubview(nameTeamLabel)
        backView.addSubview(numberPeopleLabel)
    }

    func setupConstraints() {
        backView.snp.makeConstraints { make in
            make.leading.equalTo(self).offset(10)
            make.trailing.equalTo(self).inset(10)
            make.height.equalTo(130)
        }
        nameTeamLabel.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.top.equalTo(10)
        }
        numberPeopleLabel.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.top.equalTo(50)
        }
    }

    func setData(team: Team) {
        nameTeamLabel.text = team.id
    }
}
