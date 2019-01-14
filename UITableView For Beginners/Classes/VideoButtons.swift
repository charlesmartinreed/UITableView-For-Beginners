//
//  VideoButtons.swift
//  UITableView For Beginners
//
//  Created by Charles Martin Reed on 1/14/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import Foundation
import UIKit

class VideoButton : UIButton {
    required override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        //giving all of our regular buttons a rounded corner radius
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }
}

class GhostedVideoButton : UIButton {
    required override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        //giving all of ours buttons a rounded corner radius
        layer.cornerRadius = self.frame.height / 2
        layer.borderWidth = 2
        layer.borderColor = UIColor(red: 231.0/255.0, green: 60.0/255.0, blue: 60.0/255.0, alpha: 1.0).cgColor
        clipsToBounds = true
    }
}

