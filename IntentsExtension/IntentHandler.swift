/*
	Copyright (C) 2016 Apple Inc. All Rights Reserved.
	See LICENSE.txt for this sample’s licensing information
	
	Abstract:
	Intents handler principal class
*/

import Intents

class IntentHandler: INExtension, INStartAudioCallIntentHandling {

    func handle(startAudioCall startAudioCallIntent: INStartAudioCallIntent, completion: (INStartAudioCallIntentResponse) -> Void) {
        let response: INStartAudioCallIntentResponse
        defer {
            completion(response)
        }

        // Ensure there is a contact and a handle
        guard startAudioCallIntent.contacts?.first?.handle != nil else {
            response = INStartAudioCallIntentResponse(code: .failure, userActivity: nil)
            return
        }

        let userActivity = NSUserActivity(activityType: String(INStartAudioCallIntent.self))

        response = INStartAudioCallIntentResponse(code: .success, userActivity: userActivity)
    }
}
