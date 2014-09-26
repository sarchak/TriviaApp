//
//  FunFact.swift
//  TriviaApp
//
//  Created by Shrikar Archak on 9/25/14.
//  Copyright (c) 2014 Shrikar Archak. All rights reserved.
//

import Foundation
struct FunFact {
    let session = NSURLSession.sharedSession()
    
    func randomFact() -> NSString {
        var rfact : NSString = "Happy to provide you with an awesome fact"
//        let baseURL = NSURL(string: "http://numbersapi.com/random/trivia")
//        let downloadTask = session.downloadTaskWithURL(baseURL, completionHandler: { (location, response, error) -> Void in
//            if(error == nil){
//                let objectData = NSData(contentsOfURL: location)
//                let tmpData = NSString(contentsOfURL: location, encoding: NSUTF8StringEncoding, error: nil)
//                
//                return rfact
//            }
//        })
        return rfact
    }

    
}