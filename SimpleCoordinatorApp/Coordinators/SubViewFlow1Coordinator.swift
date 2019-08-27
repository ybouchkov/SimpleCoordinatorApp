//
//  SubViewFlow1Coordinator.swift
//  SimpleCoordinatorApp
//
//  Created by Yani Buchkov on 26.08.19.
//  Copyright © 2019 MobileBGTeam. All rights reserved.
//

import UIKit

class SubViewFlow1Coordinator: NSObject, Coordinator {
    
    // MARK: - Coordinator
    
    var navigationController: UINavigationController
    
    var childCoordinators: [Constants.CoordinatorKeys : Coordinator]
    
    private let preferredNavigationStyle: NavigationStyle
    private var removeCoordinatorWhenViewDismissed: ((Coordinator) -> ())
    
    // MARK: - Initializer
    
    init(navigationController: UINavigationController,
         preferredNavigationStyle: NavigationStyle,
         removeCoordinatorWhenViewDismissed: @escaping ((Coordinator) -> ())) {
        
        self.navigationController = navigationController
        self.preferredNavigationStyle = preferredNavigationStyle
        self.removeCoordinatorWhenViewDismissed = removeCoordinatorWhenViewDismissed
        self.childCoordinators = [:]
        super.init()
        
        navigationController.delegate = self
        start()
    }
    
    func start() {
        let subViewFlow1 = SubViewFlow1ViewController(action: navigateToSubViewOfFlow1View)
        navigate(to: subViewFlow1, with: preferredNavigationStyle, animated: true)
    }
    
    private func navigateToSubViewOfFlow1View(title: String) {
        let detailView = SubViewFromViewFlow1ViewController(titleText: title)
        navigate(to: detailView, with: .push, animated: true)
    }
}

extension SubViewFlow1Coordinator: UINavigationControllerDelegate {
    
    /// In this implementation of navigationController(_:didShow:animated:), the guard let statement gets the ViewController that is being navigated away from, followed by checking that this viewController is no longer contained in the navigationController’s viewControllers variable.

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let viewController = navigationController.transitionCoordinator?.viewController(forKey: .from), !navigationController.viewControllers.contains(viewController) else {
            return
        }
        
        if viewController is SubViewFromViewFlow1ViewController {
            removeCoordinatorWhenViewDismissed(self)
        }
    }
}
