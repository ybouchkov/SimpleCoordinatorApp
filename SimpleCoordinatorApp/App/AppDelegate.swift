//
//  AppDelegate.swift
//  SimpleCoordinatorApp
//
//  Created by Yani Buchkov on 26.08.19.
//  Copyright © 2019 MobileBGTeam. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private lazy var appCoordinator: AppCoordinator = {
        return AppCoordinator(in: window ?? UIWindow())
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        appCoordinator.start()
        return true
    }
}

