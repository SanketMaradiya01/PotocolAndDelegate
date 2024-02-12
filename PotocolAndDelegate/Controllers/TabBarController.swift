//
//  TabBarController.swift
//  PotocolAndDelegate
//
//  Created by Nimap on 12/02/24.
//

import UIKit

class TabBarController: UITabBarController {

    var Tabbar : UITabBarController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let FirstVC = ViewController()
        let SecondVC = SecondViewController()
        
        FirstVC.title = "Home"
        FirstVC.tabBarItem.image = UIImage(systemName: "house")
        
        SecondVC.title = "Settings"
        SecondVC.tabBarItem.image = UIImage(systemName: "gear")
        
        viewControllers = [FirstVC, SecondVC]
    }
}
