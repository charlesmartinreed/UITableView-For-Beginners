//
//  DetailViewController.swift
//  UITableView For Beginners
//
//  Created by Charles Martin Reed on 1/14/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController {
    
    //MARK:- Properties
    var video: Video?
    var videoURL: URL!
    
    //MARK:- IBOutlets
    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var videoDescriptionLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //if we've got a video
        if let video = video {
            videoImageView.image = video.image
            videoTitleLabel.text = video.title
            videoDescriptionLabel.text = video.description
            videoURL = URL(string: video.url)
        }
    }
    
    //MARK:- IBActions
    @IBAction func watchButtonTapped(_ sender: VideoButton) {
        let safariVC = SFSafariViewController(url: videoURL)
        present(safariVC, animated: true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
