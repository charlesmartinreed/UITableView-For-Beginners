//
//  Video.swift
//  UITableView For Beginners
//
//  Created by Charles Martin Reed on 1/14/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import Foundation
import UIKit

class Video {
    var image: UIImage
    var title: String
    var url: String
    
    init(image: UIImage, title: String, url: String) {
        self.image = image
        self.title = title
        self.url = url
    }
}
