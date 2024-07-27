//
//  CustomTabBar.swift
//  SoccerBetting
//
//  Created by Behruz Norov on 14/07/24.
//
import UIKit

class CustomTabBar: UITabBar {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let itemHeight: CGFloat = 100.0
        let itemOffset: CGFloat = 25.0

        for subview in self.subviews {
            if let tabBarButton = subview as? UIControl {
                var frame = tabBarButton.frame
                frame.origin.y -= itemOffset
                frame.size.height = itemHeight
                tabBarButton.frame = frame
            }
        }
    }
}
