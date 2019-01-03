//
//  IntentViewController.swift
//  SiriShortcutsDemo
//
//  Created by 邹亮明 on 2018/12/11.
//  Copyright © 2018 zlm. All rights reserved.
//

import UIKit
import Intents
import IntentsUI

class IntentViewController: UIViewController {
    
    private var isAdded: Bool = false
    private var voiceShortCut: INVoiceShortcut?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadVoice()
        // Do any additional setup after loading the view.
    }
    
    private func loadVoice() {
        INVoiceShortcutCenter.shared.getAllVoiceShortcuts { (voiceShortCuts, error) in
            guard let voiceShortCuts = voiceShortCuts, error == nil else { return }
            for voiceShortCut in voiceShortCuts {
                if voiceShortCut.shortcut.intent is IntentDemoIntent {
                    self.voiceShortCut = voiceShortCut
                    self.isAdded = true
                    break
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
            let intent = IntentDemoIntent()
            if let shortCuts = INShortcut(intent: intent) {
                let viewController = INUIAddVoiceShortcutViewController(shortcut: shortCuts)
                viewController.delegate = self
                present(viewController, animated: true, completion: nil)
            }
        }
    }
}

extension IntentViewController: INUIAddVoiceShortcutViewControllerDelegate {
    func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) {
        loadVoice()
        controller.dismiss(animated: true, completion: nil)
    }
    
    func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

extension IntentViewController: INUIEditVoiceShortcutViewControllerDelegate {
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
