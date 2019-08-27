//
//  MainViewCoordinator.swift
//  SimpleCoordinatorApp
//
//  Created by Yani Buchkov on 26.08.19.
//  Copyright © 2019 MobileBGTeam. All rights reserved.
//

import UIKit

class MainViewCoordinator: Coordinator {
    
    internal var navigationController: UINavigationController
    
    internal var childCoordinators: [Constants.CoordinatorKeys : Coordinator]
    
    // MARK: - Initializer

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.childCoordinators = [:]
        
        start()
    }
    
    internal func start() {
        let mainViewController = MainViewController(with: navigateToSubFlow1, action2: navigateToSubFlow2)
        navigate(to: mainViewController, with: .push, animated: false)
    }
    
    private func navigateToSubFlow1() {
        let coordinator = SubViewFlow1Coordinator(navigationController: navigationController,
                                                  preferredNavigationStyle: .push,
                                                  removeCoordinatorWhenViewDismissed: removeChild(coordinator:))
        addChild(coordinator: coordinator, with: .subView1Coordinator)
    }
    
    private func navigateToSubFlow2() {
        let coordinator = SubViewFlow2Coordinator(navigationController: navigationController,
                                                  preferredNavigationStyle: .push,
                                                  removeCoordinatorWhenDissmied: removeChild(coordinator:))
        addChild(coordinator: coordinator, with: .subView2Coordinator)
    }
}
