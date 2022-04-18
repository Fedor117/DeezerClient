//
//  SentryAppDelegate.swift
//  DeezerClient
//
//  Created by Fedar Valiauka on 18/04/2022.
//

import UIKit
import Sentry

final class SentryAppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil)
    -> Bool {
        SentrySDK.start { options in
            options.dsn = Secrets.sentryDsn
            options.debug = true
            options.tracesSampleRate = 1.0
        }

        return true
    }
}
