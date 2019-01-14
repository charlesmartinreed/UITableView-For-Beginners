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
    var description: String
    var url: String
    
    init(image: UIImage, title: String, description: String, url: String) {
        self.image = image
        self.title = title
        self.description = description
        self.url = url
    }
    
    class func createVideoArray() -> [Video] {
        var videos = [Video]()
        
        //using image literals here to avoid stringly typed image names
        let video1 = Video(image: #imageLiteral(resourceName: "int-overview"),
                           title: "iOS Interview Questions",
                           description: "Learn the best answers to common questions and how to handle curveballs with grace and poise.",
                           url: "https://youtu.be/DkCoGkyxMxY")
        
        let video2 = Video(image: #imageLiteral(resourceName: "vlog-4"),
                           title: "A Typical Day for an iOS Contractor",
                           description: "From sunrise to sunset, how to stay on your hustle and make each day a little better than the last one.",
                           url: "https://www.youtube.com/watch?v=Fi0Ip7Nkp60")
        
        let video3 = Video(image: #imageLiteral(resourceName: "ss-delegates"),
                           title: "UIButtons in UITableViewCell",
                           description: "Working with UIButtons nested in a UITableViewCell can be tricky... until you learn how to delegate tasks!",
                           url: "https://www.youtube.com/watch?v=UPrBXUWPf6Q")
        
        let video4 = Video(image: #imageLiteral(resourceName: "dev-setup"),
                           title: "My Dev Setup",
                           description: "Want to know what my workspace looks like?",
                           url: "https://www.youtube.com/watch?v=ZiYx_4eeOms")
        
        let video5 = Video(image: #imageLiteral(resourceName: "ss-uipickerview-card"),
                           title: "UIPickerView Tutorial",
                           description: "Learn how to allow your users to choose images.",
                           url: "https://www.youtube.com/watch?v=HkDDGfMiuOA")
        
        let video6 = Video(image: #imageLiteral(resourceName: "beginner-first-app"),
                           title: "Building Your First App",
                           description: "Every journey begins with a single step.",
                           url: "https://www.youtube.com/watch?v=aiXvvL1wNUc")
        
        videos.append(video1)
        videos.append(video2)
        videos.append(video3)
        videos.append(video4)
        videos.append(video5)
        videos.append(video6)
        
        return videos
    }
}
