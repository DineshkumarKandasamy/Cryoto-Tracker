//
//  TabbarController.swift
//  Task2
//
//  Created by Rufan Abdurahmanov on 22.04.22.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 0:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "coinTabSelected"), object: nil)
        default:
            break
        }
    }
}
