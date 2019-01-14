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
        
        //this sets video equal to the returned array from our func
        videos = createVideoArray()
        
        //set this view controller as delegate and data source
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //MARK:- Navbar creation
    func addNavBarImage() {
        
    }
    
    //MARK:- Array creation
    func createVideoArray() -> [Video] {
        //create video objects, place them in a temp array, add this array to global scoped array
        var tempVideos = [Video]()
        
        //using image literals here to avoid stringly typed image names
        let video1 = Video(image: #imageLiteral(resourceName: "int-overview"), title: "iOS Interview Questions", url: "https://www.youtube.com/watch?v=UPrBXUWPf6Q")
        let video2 = Video(image: #imageLiteral(resourceName: "vlog-4"), title: "A Typical Day for an iOS Contractor", url: "https://www.youtube.com/watch?v=UPrBXUWPf6Q")
        let video3 = Video(image: #imageLiteral(resourceName: "ss-delegates"), title: "UIButtons in UITableViewCell", url: "https://www.youtube.com/watch?v=UPrBXUWPf6Q")
        let video4 = Video(image: #imageLiteral(resourceName: "dev-setup"), title: "My Dev Setup", url: "https://www.youtube.com/watch?v=UPrBXUWPf6Q")
        let video5 = Video(image: #imageLiteral(resourceName: "ss-uipickerview-card"), title: "UIPickerView Tutorial", url: "https://www.youtube.com/watch?v=UPrBXUWPf6Q")
        let video6 = Video(image: #imageLiteral(resourceName: "beginner-first-app"), title: "Building Your First App", url: "https://www.youtube.com/watch?v=UPrBXUWPf6Q")
        
        tempVideos.append(video1)
        tempVideos.append(video2)
        tempVideos.append(video3)
        tempVideos.append(video4)
        tempVideos.append(video5)
        tempVideos.append(video6)
        
        return tempVideos
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
