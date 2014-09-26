//
//  ViewController.swift
//  TriviaApp
//
//  Created by Shrikar Archak on 9/25/14.
//  Copyright (c) 2014 Shrikar Archak. All rights reserved.
//

import UIKit
import Social
class ViewController: UIViewController {
    let colors = Colors()
    let funFact = FunFact()
    let session = NSURLSession.sharedSession()
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tweetButtonLabel: UIButton!
    @IBOutlet weak var factButtonText: UIButton!
    @IBOutlet weak var factText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidden = false
        randomFact()

    }

    func randomFact() {
        let baseURL = NSURL(string: "http://numbersapi.com/random/trivia")
        let downloadTask = session.downloadTaskWithURL(baseURL, completionHandler: { (location, response, error) -> Void in
            if(error == nil){
                let objectData = NSData(contentsOfURL: location)
                let tmpData :NSString = NSString(data: objectData, encoding: NSUTF8StringEncoding)
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in                    self.factText.text = tmpData
                    if (tmpData.length > 130){
                        self.tweetButtonLabel.hidden = true
                    } else {
                        self.tweetButtonLabel.hidden = false
                    }
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.hidden = true
                })
            } else {
                let alertViewController = UIAlertController(title: "Error", message: "Couldn't connect to network", preferredStyle: .Alert)
                let okButton = UIAlertAction(title: "OK", style: .Default, handler: nil)
                let cancelButton = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
                alertViewController.addAction(okButton)
                alertViewController.addAction(cancelButton)
                self.presentViewController(alertViewController, animated: true, completion: nil)
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.hidden = true
                })
            }

        })
        downloadTask.resume()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tweetButton() {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {

            var tweetSheet = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            tweetSheet.setInitialText(factText.text + " #TriviaApp")
            self.presentViewController(tweetSheet, animated: true, completion: nil)
        } else {
            print ("No twitter account")
        }
    }
   
    @IBAction func factButton() {
        let color = colors.randomColor()
        view.backgroundColor = color
        factButtonText.tintColor = color
        randomFact()
    }

}

