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
    let cellIdentifier = "VideoCell"
    let detailViewSegueIdentifier = "MasterToDetail"
    
    //MARK:- IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AddLogoToNavBar() //UIViewController extension method
        
        //this sets video equal to the returned array from our func
        videos = Video.createVideoArray()
        
        tableView.delegate = self
        tableView.dataSource = self
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
        
    
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! VideoCell
        
        //further cell configuration occurs in the cell file itself
        cell.setVideo(video: video)
        cell.delegate = self
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == detailViewSegueIdentifier {
            if let destinationVC = segue.destination as? DetailViewController {
                if let video = sender as? Video {
                    destinationVC.video = video
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //need to perform a segue here
        let video = videos[indexPath.row]
        performSegue(withIdentifier: detailViewSegueIdentifier, sender: video)
    }
    
    
}
