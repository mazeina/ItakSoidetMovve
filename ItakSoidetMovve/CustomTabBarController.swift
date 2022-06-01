//
//  CustomTabBarController.swift
//  ItakSoidetMovve
//
//  Created by admin on 31.05.2022.
//

import Foundation
import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
      super.viewDidLoad()

        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: CGRect(x: 30, y: self.tabBar.bounds.minY + 5, width: self.tabBar.bounds.width - 60, height: self.tabBar.bounds.height + 10), cornerRadius: (self.tabBar.frame.width/2)).cgPath
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        layer.shadowRadius = 25.0
        layer.shadowOpacity = 0.3
        layer.borderWidth = 1.0
        layer.opacity = 1.0
        layer.isHidden = false
        layer.masksToBounds = false
        layer.fillColor = UIColor(named: Constants.Colors.red)?.cgColor

         tabBar.layer.insertSublayer(layer, at: 0)
         if let items = self.tabBar.items {
           items.forEach { item in item.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -15, right: 0) }
         }

         tabBar.itemWidth = 40.0
         tabBar.itemPositioning = .centered

     }
    
     override func viewDidLayoutSubviews() {
         tabBar.frame = CGRect(x: 0,y: (UIScreen.main.bounds.height - tabBar.frame.height) ,width: UIScreen.main.bounds.width,height: 55)
     }
}
