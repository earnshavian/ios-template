//
//  CrashlyticsConfiguration.swift
//  PRODUCTNAME
//
//  Created by LEADDEVELOPER on 11/1/16.
//  Copyright © 2017 ORGANIZATION. All rights reserved.
//

import Fabric
import Crashlytics
import UIKit

struct CrashReportingConfiguration: AppLifecycle {

    var isEnabled: Bool {
        return BuildType.active != .debug
    }

    func onDidLaunch(application: UIApplication, launchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        Fabric.with([Crashlytics.self])
    }

}
