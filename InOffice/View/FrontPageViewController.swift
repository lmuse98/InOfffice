//
//  FrontPageViewController.swift
//  InOffice
//
//  Created by Luka Muše on 14.12.2021..
//

import UIKit

class FrontPageViewController: UIViewController {

    private var userNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    private func configure() {
        view.addSubview(userNameLabel)
        view.backgroundColor = .white
        title = "Hello"
    }

    func setData(_ user: User) {
        userNameLabel.text = user.name
    }
}
