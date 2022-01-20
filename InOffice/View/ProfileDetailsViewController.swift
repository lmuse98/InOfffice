//
//  ProfileDetailsViewController.swift
//  InOffice
//
//  Created by Luka Muše on 15.12.2021..
//

import UIKit

class ProfileDetailsViewController: UIViewController {

    var viewModel: ProfileDetailsViewModel

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Profile"
        setupViews()
        setupConstraints()
        viewModel.delegate = self
        viewModel.loaded()
    }

    init(viewModel: ProfileDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var tableView: UITableView = {
       let table = UITableView()
       return table
    }()

    private lazy var avatar: UIImageView = {
        let image = UIImageView()
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.lightGray.cgColor
        image.layer.cornerRadius = 60
        image.clipsToBounds = true
        return image
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        return label
    }()

    private lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Personal", "Social"])
        control.selectedSegmentIndex = 0
        control.layer.borderColor = UIColor.gray.cgColor
        control.tintColor = .gray
        return control
    }()

    private lazy var upperView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.layer.cornerRadius = 10
        return view
    }()

    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()

    private func setupViews() {
        view.addSubview(upperView)
        view.addSubview(avatar)
        view.addSubview(titleLabel)
        view.addSubview(segmentedControl)
        view.addSubview(editButton)
        view.addSubview(tableView)
    }

    private func setupConstraints() {
        avatar.snp.makeConstraints { make in
            make.centerX.equalTo(upperView)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.width.equalTo(120)
            make.height.equalTo(120)
        }
        upperView.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.height.equalTo(220)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
        }
        segmentedControl.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.bottom.equalTo(upperView.snp.bottom).offset(80)
            make.width.equalTo(300)
        }
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(upperView)
            make.bottom.equalTo(avatar.snp.bottom).offset(45)
        }
    }
}

extension ProfileDetailsViewController: ProfileDetailsViewModelDelegate {
    func show(user: User?) {
        titleLabel.text = user?.name
        //avatar.image = user.photoId
    }
}
