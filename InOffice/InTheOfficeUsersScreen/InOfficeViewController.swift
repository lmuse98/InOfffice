//
//  HomeViewController.swift
//  InOffice
//
//  Created by Luka Muše on 09.12.2021..
//

import UIKit

class InOfficeViewController: UIViewController {

    var userViewModel = UsersViewModel()
    var content = ContentManager()

    private var users: [User]?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        tableView.delegate = self
        tableView.dataSource = self

        content.getOnlineUsers = { [weak self] users in
            self?.users = users
            self?.tableView.reloadData()
            //debugPrint(" 🎉 \(users)")
        }
    }

    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.backgroundColor = .clear
        table.register(UserCell.self, forCellReuseIdentifier: UserCell.Constant.cellName)
        table.register(HeaderSectionCell.self, forHeaderFooterViewReuseIdentifier: HeaderSectionCell.Constant.cellName)
        return table
    }()

    private func configureView() {
        view.addSubview(tableView)
        setupBackground()

        tableView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(view.snp.bottom)
        }
    }

    func setupBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds

        let color2 = UIColor(red: 0.88, green: 0.93, blue: 1.00, alpha: 1.00).cgColor
        let color3 = UIColor(red: 0.86, green: 0.90, blue: 1.00, alpha: 1.00).cgColor
        let color1 = UIColor(red: 1.00, green: 0.97, blue: 0.92, alpha: 1.00).cgColor

        gradientLayer.colors = [color3, color2, color1]
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 1)

        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension InOfficeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userViewModel.users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.Constant.cellName, for: indexPath) as? UserCell else {
            return UITableViewCell()
        }
        guard userViewModel.users.count >= indexPath.row else { return UITableViewCell() }
        let user = userViewModel.users[indexPath.row]
        cell.setData(user)
        cell.backgroundColor = .clear
        cell.accessoryType = .detailButton
        return cell
    }

    func selectUser (_ indexPath: IndexPath) {
        tableView.reloadRows(at: [indexPath], with: .none)
        let user = userViewModel.users[indexPath.row]
        let viewModel = ProfileDetailsViewModel(user: user)
        let profileDetailsVC = ProfileDetailsViewController(viewModel: viewModel)
        profileDetailsVC.modalPresentationStyle = .pageSheet
        navigationController?.pushViewController(profileDetailsVC, animated: true)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectUser(indexPath)
        //present(profileDetailsVC, animated: true)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderSectionCell.Constant.cellName) as? HeaderSectionCell
        else {
            return UITableViewHeaderFooterView()
        }
        headerCell.setData(title: "Today in office")
        return headerCell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
