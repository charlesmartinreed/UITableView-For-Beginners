//
//  VideoCell.swift
//  UITableView For Beginners
//
//  Created by Charles Martin Reed on 1/14/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import UIKit

//MARK:- protocol and delegate methods
protocol VideoCellDelegate {
    //commands we give to our conforming controller
    func didTapWatchLater(title: String)
    func didTapWatchNow(url: String)
}

class VideoCell: UITableViewCell {

    //MARK:- IBOutlets
    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var watchLaterButton: GhostedVideoButton!
    @IBOutlet weak var watchNowButton: VideoButton!
    
    var videoItem: Video!
    var delegate: VideoCellDelegate? //assigned to something, in this case, the view controller
    
    
    //MARK:- Cell setup
    func setVideo(video: Video) {
        videoItem = video
        videoImageView.image = video.image
        videoTitleLabel.text = video.title
    }
    
    @IBAction func watchNowTapped(_ sender: VideoButton) {
        //when watch now button tapped, delegate (view controller) should execute this, using the passed param(s)
        delegate?.didTapWatchNow(url: videoItem.url)
    }
    
    @IBAction func watchLaterTapped(_ sender: GhostedVideoButton) {
        //when watch later button tapped, delegate (view controller) should execute this, using the passed param(s)
        delegate?.didTapWatchLater(title: videoItem.title)
    }
    
    
}
