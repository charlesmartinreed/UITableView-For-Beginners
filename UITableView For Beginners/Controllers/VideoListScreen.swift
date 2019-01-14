//
//  VideoListScreen.swift
//  UITableView For Beginners
//
//  Created by Charles Martin Reed on 1/14/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import UIKit
import SafariServices

class VideoListScreen: UIViewController {

    //MARK:- Properties
    var videos = [Video]()
    
    //MARK:- IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNavBarImage()
        
        //this sets video equal to the returned array from our func
        createVideoArray()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //MARK:- Navbar creation
    func addNavBarImage() {
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
    
    //MARK:- Array creation
    func createVideoArray() {
        //using image literals here to avoid stringly typed image names
        let video1 = Video(image: #imageLiteral(resourceName: "int-overview"), title: "iOS Interview Questions", url: "https://youtu.be/DkCoGkyxMxY")
        let video2 = Video(image: #imageLiteral(resourceName: "vlog-4"), title: "A Typical Day for an iOS Contractor", url: "https://www.youtube.com/watch?v=Fi0Ip7Nkp60")
        let video3 = Video(image: #imageLiteral(resourceName: "ss-delegates"), title: "UIButtons in UITableViewCell", url: "https://www.youtube.com/watch?v=UPrBXUWPf6Q")
        let video4 = Video(image: #imageLiteral(resourceName: "dev-setup"), title: "My Dev Setup", url: "https://www.youtube.com/watch?v=ZiYx_4eeOms")
        let video5 = Video(image: #imageLiteral(resourceName: "ss-uipickerview-card"), title: "UIPickerView Tutorial", url: "https://www.youtube.com/watch?v=HkDDGfMiuOA")
        let video6 = Video(image: #imageLiteral(resourceName: "beginner-first-app"), title: "Building Your First App", url: "https://www.youtube.com/watch?v=aiXvvL1wNUc")
        
        videos.append(video1)
        videos.append(video2)
        videos.append(video3)
        videos.append(video4)
        videos.append(video5)
        videos.append(video6)
    }
}

extension VideoListScreen : VideoCellDelegate {
    //MARK:- Custom protocol conformation methods
    func didTapWatchLater(title: String) {
        //TODO: Add actual Watch Later functionality?
        let alertTitle = "Watch Later"
        let message = "\(title) added to Watch Later list"
        
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func didTapWatchNow(url: String) {
        guard let videoURL = URL(string: url) else { return }
        let safariVC = SFSafariViewController(url: videoURL)
        present(safariVC, animated: true, completion: nil)
    }
    
    
}

extension VideoListScreen : UITableViewDataSource, UITableViewDelegate {
    
    //MARK:- Delegate conformation methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let video = videos[indexPath.row]
        
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell") as! VideoCell
        
        //further cell configuration occurs in the cell file itself
        cell.setVideo(video: video)
        cell.delegate = self
        
        return cell
    }
    
    
}
