//
//  TabBarController.swift
//  SoccerBetting
//
//  Created by Behruz Norov on 13/07/24.
//

import UIKit

class TabBarController: UITabBarController {
    let mainVCStoryboard = UIStoryboard(name: "Main", bundle: .main)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pushVC()
        let customTabBar = CustomTabBar()
        setValue(customTabBar, forKey: "tabBar")
        setTabBarAppearance()
        
        self.selectedIndex = 1
        self.selectedIndex = 0
    }

    private func setTabBarAppearance() {
        if #available(iOS 15.0, *) {
            let tabBarAppearance = UITabBarAppearance()

            tabBarAppearance.backgroundColor = UIColor(red: 26/255, green: 22/255, blue: 89/255, alpha: 1)
            self.tabBar.standardAppearance = tabBarAppearance
            self.tabBar.scrollEdgeAppearance = tabBarAppearance
            self.tabBar.tintColor = UIColor.white
        } else {
            self.tabBar.barTintColor = UIColor(red: 26/255, green: 22/255, blue: 89/255, alpha: 1)
            self.tabBar.tintColor = UIColor.white
        }
    }

    func pushVC() {
        let firstVC = mainVCStoryboard.instantiateViewController(withIdentifier: "FirstTabVC")
        firstVC.tabBarItem.image = UIImage(named: "Property1=1")
        firstVC.tabBarItem.selectedImage = UIImage(named: "Property2=1")
        let firstVCC = UINavigationController(rootViewController: firstVC)

        let secondVC = mainVCStoryboard.instantiateViewController(withIdentifier: "SecondTabVC")
        secondVC.tabBarItem.image = UIImage(named: "Property1=2")
        secondVC.tabBarItem.selectedImage = UIImage(named: "Property2=2")
        let secondVCC = UINavigationController(rootViewController: secondVC)

        let thirdVC = mainVCStoryboard.instantiateViewController(withIdentifier: "ThirdTabVC")
        thirdVC.tabBarItem.image = UIImage(named: "Property1=3")
        thirdVC.tabBarItem.selectedImage = UIImage(named: "Property2=3")
        let thirdVCC = UINavigationController(rootViewController: thirdVC)

        let fourthVC = mainVCStoryboard.instantiateViewController(withIdentifier: "FourthTabVC")
        fourthVC.tabBarItem.image = UIImage(named: "Property1=4")
        fourthVC.tabBarItem.selectedImage = UIImage(named: "Property2=4")
        let fourthVCC = UINavigationController(rootViewController: fourthVC)

        let fifthVC = mainVCStoryboard.instantiateViewController(withIdentifier: "FifthTabVC")
        fifthVC.tabBarItem.image = UIImage(named: "Property1=5")
        fifthVC.tabBarItem.selectedImage = UIImage(named: "Property2=5")
        let fifthVCC = UINavigationController(rootViewController: fifthVC)

        self.viewControllers = [firstVCC, secondVCC, thirdVCC, fourthVCC, fifthVCC]
    }
}
