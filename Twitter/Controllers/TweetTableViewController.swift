//
//  TweetTableViewController.swift
//  Twitter
//
//  Created by Sergio P. on 10/27/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit
import AlamofireImage

class TweetTableViewController: UITableViewController {
    
    var tweetList = [NSDictionary]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tweetList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetTableViewCell", for: indexPath) as! TweetTableViewCell
        
        let activeTweet = self.tweetList[indexPath.row]
        let user = (activeTweet["user"] as! [String: Any])
        
        let fav_count = (activeTweet["favorite_count"] as! Int)
        let rt_count = (activeTweet["retweet_count"] as! Int)
        let user_profile_image_url = (user["profile_image_url_https"] as! String)
        let imageUrl = URL(string: user_profile_image_url)
        
        cell.tweetId = (activeTweet["id"] as! Int)
        cell.name.text = (user["name"] as! String)
        cell.screenName.text = "@" + (user["screen_name"] as! String)
        cell.tweetText.text = (activeTweet["text"] as! String)
        cell.retweetCount.text = String(rt_count)
        cell.favoriteCount.text = String(fav_count)
        cell.profileImage.af_setImage(withURL: imageUrl!)
        cell.setFavorite(activeTweet["favorited"] as! Bool)
        cell.setRetweet(activeTweet["retweeted"] as! Bool)

        return cell
    }
    
    // MARK: - Network Calls
    func requestTweets(baseUrl: String, params: [String: Any]) {
        TwitterAPICaller.client?.getDictionariesRequest(url: baseUrl,
                                                        parameters: params,
                                                        success: { (tweets: [NSDictionary]) in
                                                            self.tweetList = tweets
                                                            self.tableView.reloadData()
        },
                                                        failure: { (Error) in
                                                            print("Could not load tweets.")
        })
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
