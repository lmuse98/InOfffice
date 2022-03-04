//
//  TeamDetailsViewController.swift
//  InOffice
//
//  Created by Luka Muše on 10.02.2022..
//

import UIKit

class TeamDetailsViewController: UIViewController, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupViews()
    }

    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.frame = view.frame
        table.backgroundColor = .clear
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.register(UserCell.self, forCellReuseIdentifier: UserCell.Constant.cellName)
        table.register(TeamHeaderSectionCell.self, forHeaderFooterViewReuseIdentifier: TeamHeaderSectionCell.Constant.cellName)
        return table
    }()

    private func setupViews() {
        view.addSubview(tableView)
    }
}
extension TeamDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.Constant.cellName, for: indexPath) as? UserCell else {
            return UITableViewCell()
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderSectionCell.Constant.cellName) as? HeaderSectionCell
        else {
            return UITableViewHeaderFooterView()
        }
        headerCell.setData(title: "aaaaa")
        return headerCell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
