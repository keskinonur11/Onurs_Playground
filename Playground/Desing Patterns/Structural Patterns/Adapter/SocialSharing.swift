//
//  SocialSharing.swift
//  Playground
//
//  Created by Onur Keskin on 3.01.2020.
//  Copyright © 2020 Onur Keskin. All rights reserved.
//

//isSent property is used for simulating share result

import Foundation

protocol SocialSharing {
    func share(message: String, completionHandler: @escaping (SocialSharingErrors?) -> Void)
}

enum SocialSharingErrors: String, Error, CustomStringConvertible {
    case connectionError = "No internet connection", dataError = "Invalid data", invalidAuth = "Authorization error"
    
    public var description: String {
        return "\(self.rawValue)"
    }
    
    var localizedDescription: String {
        return "\(self.rawValue)"
    }
}

class FBSharer: SocialSharing {
    static let shared = FBSharer()
    private let isSent = true
    private let errorType = SocialSharingErrors.dataError
    
    init() { }
    
    func share(message: String, completionHandler: @escaping (SocialSharingErrors?) -> Void) {
        if(isSent) {
            print("Message \(message) shared on FB")
            completionHandler(nil)
        } else {
            completionHandler(errorType)
        }
    }
}

class TwitterSharer: SocialSharing {
    static let shared = TwitterSharer()
    private let isSent = true
    private let errorType = SocialSharingErrors.connectionError
    
    init() { }
    
    func share(message: String, completionHandler: @escaping (SocialSharingErrors?) -> Void) {
        if(isSent) {
            print("Message \(message) shared on Twitter")
            completionHandler(nil)
        } else {
            completionHandler(errorType)
        }
    }
}

//Class which needs an adapter
class RedditPoster {
    private let isSent = true
    private let errorType = SocialSharingErrors.invalidAuth
    
    func post(text: String, completion: @escaping (SocialSharingErrors?, UUID?) -> Void) {
        if(isSent) {
            print("Message \(text) shared on Reddit")
            completion(nil, nil)
        } else {
            completion(errorType, UUID.init())
        }
    }
}

//OBJECT ADAPTER - how to use adapter v1
class RedditPosterAdapter: SocialSharing {
    lazy var redditPoster = RedditPoster()
    
    func share(message: String, completionHandler: @escaping (SocialSharingErrors?) -> Void) {
        redditPoster.post(text: message, completion: { error, uuid in
            if(error != nil) {
                print("Reddit error: \(error!.description), UUID: \(uuid!)")
                completionHandler(error)
            }
        })
    }
}

//ADAPTER VIA EXTENSION  - how to use adapter v2
extension RedditPoster: SocialSharing {
    func share(message: String, completionHandler: @escaping (SocialSharingErrors?) -> Void) {
        self.post(text: message, completion: { error, uuid in
            if(error != nil) {
                print("Reddit error: \(error!.description), UUID: \(uuid!)")
                completionHandler(error)
            }
        })
    }
}


//These are too much man.. This would be my implementation of an adapter

class RedditPosterAdapted: SocialSharing {
    static let shared = RedditPosterAdapted()
    private let isSent = true
    private let errorType = SocialSharingErrors.invalidAuth
    
    init() { }
    
    func post(text: String, completion: @escaping (SocialSharingErrors?, UUID?) -> Void) {
        if(isSent) {
            print("Message \(text) shared on Reddit")
            completion(nil, nil)
        } else {
            completion(errorType, UUID.init())
        }
    }
    
    func share(message: String, completionHandler: @escaping (SocialSharingErrors?) -> Void) {
        post(text: message, completion: { error, uuid in
            if(error != nil) {
                print("Reddit error: \(error!.description), UUID: \(uuid!)")
                completionHandler(error)
            }
        })
    }
    
    
}
