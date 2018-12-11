//
//  ActityModeViewController.swift
//  SiriShortcutsDemo
//
//  Created by 邹亮明 on 2018/12/11.
//  Copyright © 2018 zlm. All rights reserved.
//

import UIKit
import MobileCoreServices
import CoreSpotlight

class ActityModeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /// Step 1: In project capabilities, open Siri
    /// Step 2: Add Intent.framework to project
    /// Step 3: change Info.plist value of NSUserActivityTypes to com.xxx.xxx.myproject(myproject is the key word)
    /// Step 4: In app, add methods like below
    /// Step 5: in Setting - Siri & Search -add myproject and add a voice, done
    /// then you can say hi siri, myproject and siri will help you to enter app
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let activity = NSUserActivity(activityType: "com.zlm.goProject.myproject") // 1
        activity.title = "Say Hi" // 2
        activity.userInfo = ["speech" : "hi"] // 3
        activity.isEligibleForSearch = true // 4
        activity.isEligibleForPrediction = true // 5
        view.userActivity = activity // 6
        activity.becomeCurrent() // 7
    }
}
