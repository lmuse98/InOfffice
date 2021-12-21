//
//  HomeViewController.swift
//  InOffice
//
//  Created by Luka Muše on 09.12.2021..
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
    }

    lazy private var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.register(CustomCell.self, forCellReuseIdentifier: "\(CustomCell.self)")
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
        return UserModel.getList().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(CustomCell.self)", for: indexPath) as? CustomCell else {
            return UITableViewCell()
        }
        guard UserModel.getList().count >= indexPath.row else { return UITableViewCell() }
        let user = UserModel.getList()[indexPath.row]
        cell.setData(user)
        cell.accessoryType = .detailButton
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let user = UserModel.getList()[indexPath.row]
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
