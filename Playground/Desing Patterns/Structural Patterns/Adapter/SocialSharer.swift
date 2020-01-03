//
//  SocialSharer.swift
//  Playground
//
//  Created by Onur Keskin on 3.01.2020.
//  Copyright © 2020 Onur Keskin. All rights reserved.
//

import Foundation

enum SharerType: String, CustomStringConvertible {
    case facebook = "Facebook", twitter = "Twitter", reddit = "Reddit"
    
    public var description: String {
        return "\(self.rawValue) sharer"
    }
}

class SocialSharer {
    private let shareServices: [SharerType : SocialSharing] = [.facebook: FBSharer.shared, .twitter: TwitterSharer.shared, .reddit: RedditPosterAdapted()]
    
    func shareEverywhere(message: String) {
        for (sharerService, sharer) in shareServices {
            sharer.share(message: message, completionHandler: { (error) in
                if error != nil {
                    print("Error while sharing \(message) via \(sharerService): \(error!.description)")
                }
            })
        }
    }
    
    func share(message: String, serviceType: SharerType, completionHandler: @escaping (Error?) -> Void) {
        if let service = shareServices[serviceType] {
            service.share(message: message, completionHandler: completionHandler)
        }
    }
}
