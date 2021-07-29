//
//  Constants.swift
//  WhatShouldIWear
//
//  Created by mac on 2021. 02. 24..
//

import UIKit

let kAppDelegate = UIApplication.shared.delegate as! AppDelegate

struct Constants {
    
    struct UIConstants {
        static let AnimationDuration = 0.3
    }
    
    struct UserDefaults {
        static let IntroSeen = "IntroSeen"
        static let ColorType = "ColorType"
        static let HairImage = "HairImage"
        static let EyeImage = "EyeImage"
        static let SkinImage = "SkinImage"
        static let HSVHueOrder = "HSVHueOrder"
        static let HSVValueOrder = "HSVValueOrder"
        static let HSVChromaOrder = "HSVChromaOrder"
        static let HSVHueChoice = "HSVHueChoice"
        static let HSVValueChoice = "HSVValueChoice"
        static let HSVChromaChoice = "HSVChromaChoice"
        static let Price = "Price"
        static let Style = "Style"
        static let Latitude = "Latitude"
        static let Longitude = "Longitude"
        static let SelectedIndex = "SelectedIndex"
        static let ReviewWorthyActionCount = "ReviewWorthyActionCount"
        static let LastReviewRequestAppVersion = "LastReviewRequestAppVersion"
        static let LocationServicesAllowed = "LocationServicesAllowed"
    }
    
    struct Notifications {
        static let TweetChanged = NSNotification.Name("TweetChanged")
        static let WardrobeChanged = NSNotification.Name("WardrobeChanged")
        static let SettingsSaved = NSNotification.Name("SettingsSaved")
        static let StopSplash = NSNotification.Name("StopSplash")
        static let ClosePopup = NSNotification.Name("ClosePopup")
    }
    
    struct Keys {
        static let WeatherApiKey = "a130cc032ed28afbb86fbc378868295b"
    }
    
    struct Strings {
        static let TOCLink = "https://yourstylistapp.wordpress.com/eula/"
        static let PPLink = "https://yourstylistapp.wordpress.com/67-2/"
    }
}
