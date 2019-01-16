//
//  UIViewController+Extension.swift
//  UITableView For Beginners
//
//  Created by Charles Martin Reed on 1/15/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import UIKit

extension UIViewController {
    //MARK:- Navbar creation
    func AddLogoToNavBar() {
        let navController = navigationController! //this grabs the nearest ancestor in a view controller hiearchy that is actually a nav controller
        
        let image = #imageLiteral(resourceName: "youtube-logo") //youtube logo
        let imageView = UIImageView(image: image)
        
        let bannerWidth = navController.navigationBar.frame.size.width
        let bannerHeight = navController.navigationBar.frame.size.height
        
        let bannerX = bannerWidth / 2 - image.size.width / 2
        let bannerY = bannerHeight / 2 - image.size.height / 2
        
        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = imageView
    }
}
