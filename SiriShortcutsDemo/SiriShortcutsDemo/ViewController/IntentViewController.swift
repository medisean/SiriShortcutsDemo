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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let intent = IntentDemoIntent()
        if let shortCuts = INShortcut(intent: intent) {
            let viewController = INUIAddVoiceShortcutViewController(shortcut: shortCuts)
            viewController.delegate = self
            present(viewController, animated: true, completion: nil)
        }
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

extension IntentViewController: INUIAddVoiceShortcutViewControllerDelegate {
    func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
