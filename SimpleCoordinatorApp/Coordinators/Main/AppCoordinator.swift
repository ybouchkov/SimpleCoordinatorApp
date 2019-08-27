//
//  AppCoordinator.swift
//  SimpleCoordinatorApp
//
//  Created by Yani Buchkov on 26.08.19.
//  Copyright © 2019 MobileBGTeam. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    
    private var window: UIWindow
    
    public var rootViewController: UIViewController {
        
        return navigationController
    }
    
    internal var navigationController: UINavigationController
    
    internal var childCoordinators: [Constants.CoordinatorKeys : Coordinator]
    
    // MARK: - Initializer
    
    init(in window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
        self.childCoordinators = [:]
        self.window.rootViewController = rootViewController
        self.window.makeKeyAndVisible()
    }
    
    // MARK: - Coordinator
    func start() {
        let mainViewCoordinator = MainViewCoordinator(navigationController: navigationController)
        addChild(coordinator: mainViewCoordinator, with: .mainViewCoordinator)
    }
}
