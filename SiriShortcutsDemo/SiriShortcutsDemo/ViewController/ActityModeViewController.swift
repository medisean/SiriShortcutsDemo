//
//  ActityModeViewController.swift
//  SiriShortcutsDemo
//
//  Created by 邹亮明 on 2018/12/11.
//  Copyright © 2018 zlm. All rights reserved.
//

import UIKit
import Intents
import IntentsUI

class ActityModeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadVoice()
    }
    
    private var isAdded: Bool = false
    private var voiceShortCut: INVoiceShortcut?
    
    private func loadVoice() {
        INVoiceShortcutCenter.shared.getAllVoiceShortcuts { (voiceShortCuts, error) in
            guard let voiceShortCuts = voiceShortCuts, error == nil else { return }
            for voiceShortCut in voiceShortCuts {
                if voiceShortCut.shortcut.userActivity?.activityType == "com.zlm.goProject.myproject" {
                    self.voiceShortCut = voiceShortCut
                    self.isAdded = true
                }
            }
        }
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        if isAdded {
            let editVoiceShortcutViewController = INUIEditVoiceShortcutViewController(voiceShortcut: voiceShortCut!)
            editVoiceShortcutViewController.delegate = self
            present(editVoiceShortcutViewController, animated: true, completion: nil)
        } else {
            /// Step 1: In project capabilities, open Siri
            /// Step 2: Add Intent.framework to project
            /// Step 3: change Info.plist value of NSUserActivityTypes to com.xxx.xxx.myproject(myproject is the key word)
            /// Step 4: In app, add methods like below
            /// Step 5: in Setting - Siri & Search -add myproject and add a voice, done
            /// then you can say hi siri, myproject and siri will help you to enter app
            /// Step 5: or in code present INUIAddVoiceShortcutViewController to add voice
            
            let activity = NSUserActivity(activityType: "com.zlm.goProject.myproject") // 1
            activity.title = "Activity Demo" // 2
            activity.userInfo = ["speech" : "Hi, shanghai"] // 3
            activity.isEligibleForSearch = true // 4
            activity.isEligibleForPrediction = true // 5
            view.userActivity = activity // 6
            activity.becomeCurrent() // 7
            let shortCuts = INShortcut(userActivity: activity)

            let viewController = INUIAddVoiceShortcutViewController(shortcut: shortCuts)
            viewController.delegate = self
            present(viewController, animated: true, completion: nil)
        }
    }
}

extension ActityModeViewController: INUIAddVoiceShortcutViewControllerDelegate {
    func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) {
        isAdded = true
        loadVoice()
        controller.dismiss(animated: true, completion: nil)
    }
    
    func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

extension ActityModeViewController: INUIEditVoiceShortcutViewControllerDelegate {
    func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController, didUpdate voiceShortcut: INVoiceShortcut?, error: Error?) {
        loadVoice()
        controller.dismiss(animated: true, completion: nil)
    }
    
    func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController, didDeleteVoiceShortcutWithIdentifier deletedVoiceShortcutIdentifier: UUID) {
        loadVoice()
        controller.dismiss(animated: true, completion: nil)
    }
    
    func editVoiceShortcutViewControllerDidCancel(_ controller: INUIEditVoiceShortcutViewController) {
        loadVoice()
        controller.dismiss(animated: true, completion: nil)
    }
}
