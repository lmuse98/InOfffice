//
//  TeamsViewController.swift
//  InOffice
//
//  Created by Luka Muše on 20.01.2022..
//

import UIKit

class TeamsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .clear

        setupBackground()
        setupTableView()
        navigationController?.navigationBar.barTintColor = .white
        
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

    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.frame = view.frame
        table.backgroundColor = .clear
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.register(TeamCell.self, forCellReuseIdentifier: TeamCell.Constant.cellName)
        table.register(TeamHeaderSectionCell.self, forHeaderFooterViewReuseIdentifier: TeamHeaderSectionCell.Constant.cellName)
        return table
    }()

    func setupTableView() {
        view.addSubview(tableView)
    }
}
extension TeamsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TeamCell.Constant.cellName, for: indexPath)
        cell.layer.shadowOpacity = 0
        cell.backgroundColor = .clear
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadRows(at: [indexPath], with: .none)
        let teamDetailsVC = TeamDetailsViewController()
        teamDetailsVC.modalPresentationStyle = .pageSheet
        navigationController?.pushViewController(teamDetailsVC, animated: true)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: TeamHeaderSectionCell.Constant.cellName) as? TeamHeaderSectionCell
        else {
            return UITableViewHeaderFooterView()
        }
        headerCell.setData(title: "Teams")
        return headerCell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
