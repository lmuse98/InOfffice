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
        view.backgroundColor = .blue
        setupTabBar()
    }

    func setupTabBar() {

        tabBarVC.tabBar.backgroundColor = .white

        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let inOfficeVC = UINavigationController(rootViewController: InOfficeViewController())
        let profileVC = UINavigationController(rootViewController: ProfileDetailsViewController(viewModel: profileViewModel))

        let home = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
        let profile = UITabBarItem(title: "Profile", image: UIImage(named: "user"), tag: 0)
        let userList = UITabBarItem(title: "UserList", image: UIImage(named: "list"), tag: 0)

        homeVC.tabBarItem = home
        inOfficeVC.tabBarItem = userList
        profileVC.tabBarItem = profile

        tabBarVC.viewControllers = [homeVC, inOfficeVC, profileVC]
        self.view.addSubview(tabBarVC.view)
    }
}
