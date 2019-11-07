//
//  TweetTableViewCell.swift
//  Twitter
//
//  Created by Sergio P. on 10/27/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var tweetText: UILabel!
    @IBOutlet weak var screenName: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var retweetCount: UILabel!
    @IBOutlet weak var favoriteCount: UILabel!
    @IBOutlet weak var retweetIcon: UIImageView!
    @IBOutlet weak var favoriteIcon: UIImageView!
    
    // MARK: - Properties
    var isFavorite: Bool!
    var isRetweeted: Bool!
    var tweetId: Int!
    var cellDelegate: TweetTableCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Favorite Tweet
    func setFavorite(_ isFav: Bool) {
        self.isFavorite = isFav
        if (self.isFavorite) {
            if #available(iOS 13.0, *) {
                favoriteIcon.image = UIImage(systemName: "heart.fill")
                favoriteIcon.tintColor = #colorLiteral(red: 0.768627451, green: 0.1843137255, blue: 0.1843137255, alpha: 1)
                favoriteCount.textColor = #colorLiteral(red: 0.768627451, green: 0.1843137255, blue: 0.1843137255, alpha: 1)
            } else {
                // Fallback on earlier versions
            }
        } else {
            if #available(iOS 13.0, *) {
                favoriteIcon.image = UIImage(systemName: "heart")
                favoriteIcon.tintColor = UIColor.darkGray
                favoriteCount.textColor = UIColor.darkGray
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
    @IBAction func onFavorite(_ sender: Any) {
        if (self.isFavorite) {
            TwitterAPICaller.client?.unFavoriteTweet(tweetId: self.tweetId,
            success: {
                self.setFavorite(false)
                let newFavCount = Int(self.favoriteCount.text!)! - 1
                self.favoriteCount.text = String(newFavCount)
                self.cellDelegate?.updateFavoriteTweet(id: self.tweetId, new_count: newFavCount)
                },
            failure: { (error) in
                print("Unfavorite did not succeed: \(error)")
                })
        } else {
            TwitterAPICaller.client?.favoriteTweet(tweetId: self.tweetId,
            success: {
                self.setFavorite(true)
                let newFavCount = Int(self.favoriteCount.text!)! + 1
                self.favoriteCount.text = String(newFavCount)
                self.cellDelegate?.updateFavoriteTweet(id: self.tweetId, new_count: newFavCount)
                },
            failure: { (error) in
                print("Favorite did not succeed: \(error)")
                })
        }
    }
    
    // MARK: - Retweet
    func setRetweet(_ isRT: Bool) {
        self.isRetweeted = isRT
        if (self.isRetweeted) {
            if #available(iOS 13.0, *) {
                retweetIcon.tintColor = #colorLiteral(red: 0.1960784314, green: 0.6705882353, blue: 0.1960784314, alpha: 1)
                retweetCount.textColor = #colorLiteral(red: 0.1960784314, green: 0.6705882353, blue: 0.1960784314, alpha: 1)
            } else {
                // Fallback on earlier versions
            }
        } else {
            if #available(iOS 13.0, *) {
                retweetIcon.tintColor = UIColor.darkGray
                retweetCount.textColor = UIColor.darkGray
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
    @IBAction func onRetweet(_ sender: Any) {
        if (self.isRetweeted) {
            TwitterAPICaller.client?.unRetweet(tweetId: self.tweetId,
            success: {
                self.setRetweet(false)
                let newRtCount = Int(self.retweetCount.text!)! - 1
                self.retweetCount.text = String(newRtCount)
                self.cellDelegate?.updateRetweet(id: self.tweetId, new_count: newRtCount)
                },
            failure: { (error) in
                print("Unretweet did not succeed: \(error)")
                })
        } else {
            TwitterAPICaller.client?.retweet(tweetId: self.tweetId,
            success: {
                self.setRetweet(true)
                let newRtCount = Int(self.retweetCount.text!)! + 1
                self.retweetCount.text = String(newRtCount)
                self.cellDelegate?.updateRetweet(id: self.tweetId, new_count: newRtCount)
                },
            failure: { (error) in
                print("Retweet did not succeed: \(error)")
                })
        }
    }
}
