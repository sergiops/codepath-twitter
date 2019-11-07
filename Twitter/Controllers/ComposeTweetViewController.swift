//
//  ComposeTweetViewController.swift
//  Twitter
//
//  Created by Sergio P. on 11/7/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class ComposeTweetViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var tweetTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tweetTextView.becomeFirstResponder()
    }
    
    // MARK: - Actions
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onTweet(_ sender: Any) {
        let tweet = tweetTextView.text!
        if (tweet.count == 0) {
            print("Not enough text")
            return
        }
        TwitterAPICaller.client?.postTweet(text: tweet,
        success: {
            print("Tweet posted!")
            },
        failure: {(error) in
            print("Failed to post tweet: \(error)")
            })
        self.dismiss(animated: true, completion: nil)
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
