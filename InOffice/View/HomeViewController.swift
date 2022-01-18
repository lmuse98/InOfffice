//
//  HomeViewController.swift
//  InOffice
//
//  Created by Luka Muše on 09.12.2021..
//

import UIKit

class HomeViewController: UIViewController {

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
            debugPrint(" 🎉 \(users)")
        }
    }

    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.register(UserCell.self, forCellReuseIdentifier: UserCell.Constant.cellName)
        table.register(HeaderSectionCell.self, forHeaderFooterViewReuseIdentifier: "\(HeaderSectionCell.self)")
        return table
    }()

    private func configureView() {
        view.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
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
        cell.accessoryType = .detailButton
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let user = userViewModel.users[indexPath.row]
        let viewModel = ProfileDetailsViewModel(user: user)
        let profileDetailsVC = ProfileDetailsViewController(viewModel: viewModel)
        navigationController?.pushViewController(profileDetailsVC, animated: true)
        present(profileDetailsVC, animated: true)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "\(HeaderSectionCell.self)") as? HeaderSectionCell
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

