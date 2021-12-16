//
//  ProfileDetailsViewController.swift
//  InOffice
//
//  Created by Luka Muše on 15.12.2021..
//

import UIKit

class ProfileDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Profile"
        setupViews()
        setupConstraints()
    }

    lazy var tableView: UITableView = {
       let table = UITableView()
        return table
    }()

    lazy var avatar: UIImageView = {
        let image = UIImageView(image: Images.james)
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.lightGray.cgColor
        image.layer.cornerRadius = 60
        image.clipsToBounds = true
        return image
    }()

    lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Personal", "Social", "Resume"])
        control.selectedSegmentIndex = 0
        control.layer.borderColor = UIColor.gray.cgColor
        control.tintColor = .gray
        return control
    }()

    lazy var upperView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()

    lazy var editButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()

    func setupViews() {
        view.addSubview(avatar)
        view.addSubview(upperView)
        view.addSubview(segmentedControl)
        view.addSubview(editButton)
        view.addSubview(tableView)
    }

    func setupConstraints() {
        avatar.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(60)
            make.width.equalTo(120)
            make.height.equalTo(120)
        }
        upperView.snp.makeConstraints { make in

        }
        segmentedControl.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.bottom.equalTo(avatar.snp.bottom).offset(40)
            make.width.equalTo(self.view)
        }
    }
    func setData(title: String) {
        //titleLabel.text = title
    }
}
