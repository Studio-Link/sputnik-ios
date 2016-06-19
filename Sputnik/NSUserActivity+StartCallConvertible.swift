/*
	Copyright (C) 2016 Apple Inc. All Rights Reserved.
	See LICENSE.txt for this sample’s licensing information
	
	Abstract:
	Extension to allow creating a CallKit CXStartCallAction from an NSUserActivity which the app was launched with
*/

import Foundation
import Intents

extension NSUserActivity: StartCallConvertible {

    private struct Constants {
        static let ActivityType = String(INStartAudioCallIntent.self)
    }

    var startCallHandle: String? {
        guard activityType == Constants.ActivityType else {
            return nil
        }

        guard let
            interaction = interaction,
            startAudioCallInternt = interaction.intent as? INStartAudioCallIntent,
            contact = startAudioCallInternt.contacts?.first
        else {
            return nil
        }

        return contact.handle
    }
    
}
