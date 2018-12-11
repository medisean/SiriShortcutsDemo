//
//  IntentViewController.swift
//  EventUI
//
//  Created by 邹亮明 on 2018/12/11.
//  Copyright © 2018 zlm. All rights reserved.
//

import IntentsUI

// As an example, this extension's Info.plist has been configured to handle interactions for INSendMessageIntent.
// You will want to replace this or add other intents as appropriate.
// The intents whose interactions you wish to handle must be declared in the extension's Info.plist.

// You can test this example integration by saying things to Siri like:
// "Send a message using <myApp>"

class IntentViewController: UIViewController, INUIHostedViewControlling {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - INUIHostedViewControlling
    
    // Prepare your view controller for the interaction to handle.
    func configureView(for parameters: Set<INParameter>, of interaction: INInteraction, interactiveBehavior: INUIInteractiveBehavior, context: INUIHostedViewContext, completion: @escaping (Bool, Set<INParameter>, CGSize) -> Void) {
        // Do configuration here, including preparing views and calculating a desired size for presentation.
        guard let intent = interaction.intent as? IntentDemoIntent else {
            completion(false, Set(), .zero)
            return
        }
        
        if interaction.intentHandlingStatus == .ready {
            completion(true, parameters, desiredSize)
        } else if interaction.intentHandlingStatus == .success {
            completion(true, parameters, desiredSize)
        }
        
        completion(false, parameters, .zero)
    }
    
    var desiredSize: CGSize {
        return self.extensionContext!.hostedViewMaximumAllowedSize
    }
    
}
