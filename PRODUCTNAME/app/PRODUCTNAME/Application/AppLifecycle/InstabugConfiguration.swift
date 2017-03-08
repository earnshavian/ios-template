//
//  InstabugConfiguration.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 11/1/16.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
//

import Instabug
import UIKit

struct InstabugConfiguration: AppLifecycle {

    var isEnabled: Bool {
        return BuildType.active == .internal
    }

    func onDidLaunch(application: UIApplication, launchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        Instabug.start(withToken: "INSERT_TOKEN_HERE", invocationEvent: .shake)
        Instabug.setEmailFieldRequired(false)
        Instabug.setCrashReportingEnabled(false)
    }

}
