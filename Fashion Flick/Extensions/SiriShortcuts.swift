//
//  SiriShortcuts.swift
//  Fashion Flick
//
//  Created by Ryan Nguyen on 9/8/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import CoreSpotlight
import Intents
import MobileCoreServices
import UIKit

public let NewOutfitActivityType = "com.fashionflick.NewOutfit"

class SiriShortuts {
    public static func newOutfitShortcut(thumbnail: UIImage?) -> NSUserActivity {
        let activity = NSUserActivity(activityType: NewOutfitActivityType)
        let attributes = CSSearchableItemAttributeSet(itemContentType: kUTTypeItem as String)
        
        activity.persistentIdentifier =
            NSUserActivityPersistentIdentifier(NewOutfitActivityType)
        activity.title = "Get dressed for the day 💃"
        activity.suggestedInvocationPhrase = "Dress me up"
        activity.isEligibleForSearch = true
        activity.isEligibleForPrediction = true
        activity.contentAttributeSet = attributes

        attributes.contentDescription = "Show you're amazing outfit to the world 🌎"
        attributes.thumbnailData = thumbnail?.jpegData(compressionQuality: 1.0)
        
        return activity
    }
}
