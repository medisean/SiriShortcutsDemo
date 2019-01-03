//
//  IntentDemoHandler.swift
//  Event
//
//  Created by 邹亮明 on 2018/12/13.
//  Copyright © 2018 zlm. All rights reserved.
//

import Foundation

class IntentDemoHandler: NSObject, IntentDemoIntentHandling {
    func handle(intent: IntentDemoIntent, completion: @escaping (IntentDemoIntentResponse) -> Void) {
        completion(IntentDemoIntentResponse(code: .success, userActivity: nil))
    }
}
