//
//  TabBarController.swift
//  emailpasslogin
//
//  Created by Franco Rodrigues on 4/30/22.
//

import UIKit
class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.view.tintColor = .darkGray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let tab1 = createNavController(for: HomeViewController(),title: "Home", image: UIImage(systemName: "house"))
        let tab2 = createNavController(for: SearchViewController(), title: "Search", image: UIImage(systemName: "magnifyingglass"))
        let tab3 = createNavController(for: FavoriteViewController(), title: "Favorites", image: UIImage(systemName: "star"))
        let tab4 = createNavController(for: ProfileViewController(), title: "Profile", image: UIImage(systemName: "person"))
        let tab5 = createNavController(for: SettingsViewController(),title: "Settings", image: UIImage(systemName: "gear"))
        
        self.viewControllers = [tab1, tab2, tab3, tab4, tab5]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.tabBarItem.title!)")
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage?) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
    
    //Tab Bar appearance BOX line
    override func viewDidAppear(_ animated: Bool) {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        tabBar.isTranslucent = true
    }
}
