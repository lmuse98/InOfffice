//
//  HomeViewController.swift
//  InOffice
//
//  Created by Luka Muše on 19.01.2022..
//

import UIKit

class TabBarViewController: UIViewController {

    let tabBarVC = UITabBarController()

    var profileViewModel = ProfileDetailsViewModel(user: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

    private func setupTabBar() {

        tabBarVC.tabBar.backgroundColor = .white
        tabBarVC.tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBarVC.tabBar.layer.shadowRadius = 5
        tabBarVC.tabBar.layer.shadowColor = UIColor.darkGray.cgColor
        tabBarVC.tabBar.layer.shadowOpacity = 0.5

        let homeVC = UINavigationController(rootViewController: HomeeViewController())
        let inOfficeVC = UINavigationController(rootViewController: InOfficeViewController())
        let profileVC = UINavigationController(rootViewController: ProfileDetailsViewController(viewModel: profileViewModel))
        let teamsVC = UINavigationController(rootViewController: TeamsViewController())

        let home = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
        let profile = UITabBarItem(title: "Profile", image: UIImage(named: "user"), tag: 0)
        let userList = UITabBarItem(title: "InOffice", image: UIImage(named: "list"), tag: 0)
        let teams = UITabBarItem(title: "Teams", image: UIImage(named: "teams"), tag: 0)

        homeVC.tabBarItem = home
        inOfficeVC.tabBarItem = userList
        profileVC.tabBarItem = profile
        teamsVC.tabBarItem = teams

        tabBarVC.viewControllers = [homeVC, inOfficeVC, teamsVC, profileVC]
        self.view.addSubview(tabBarVC.view)
    }
}
