//
//  Coordinator.swift
//  SimpleCoordinatorApp
//
//  Created by Yani Buchkov on 26.08.19.
//  Copyright © 2019 MobileBGTeam. All rights reserved.
//

import UIKit

/// This protocol outlines the basic functionality for the app’s coordinators, including the basic variables that each coordinator should have, as well as the main functions that each of the coordinators should contain. These functions will either be implemented in an extension of the protocol or by the conforming child coordinators.
protocol Coordinator: class {
    
    /// The navigationController is simply a UINavigationController, which will be used by each coordinator to present or push the view controllers that we want to display to the user.
    var navigationController: UINavigationController { get }
    /// The childCoordinators is a dictionary which will store a parent coordinator’s child coordinators. If the coordinator doesn’t initialize any child coordinators, this will simply be an empty dictionary.
    var childCoordinators: [Constants.CoordinatorKeys: Coordinator] { get set }
    
    /// The 'start' function is a basic function that each coordinator is required to implement. This function will be responsible for initializing either a coordinator’s child coordinator or the view that the coordinator is responsible for displaying.
    func start()
    
    /// addChild simply adds the coordinator parameter to the coordinator’s childCoordinators variable. The key parameter is used as the key when adding a value to the childCoordinators dictionary. Using a key here helps for potential later retrieval of the added child coordinator.
    func addChild(coordinator: Coordinator, with key: Constants.CoordinatorKeys)
    
    /// The removeChild function is filtering through the values of childCoordinators to update the childCoordinators variable to not include the passed in coordinator. This function is really important to prevent memory leaks, I will go through how to use this function in more detail later in this post.
    func removeChild(coordinator: Coordinator)
}

extension Coordinator {
    
    func addChild(coordinator: Coordinator, with key: Constants.CoordinatorKeys) {
        childCoordinators[key] = coordinator
    }

    func removeChild(coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0.value !== coordinator }
    }
}

extension Coordinator {
    
    func navigate(to viewController: UIViewController, with style: NavigationStyle, animated: Bool = true) {
        switch style {
        case .present:
            navigationController.present(viewController, animated: animated, completion: nil)
        case .push:
            navigationController.pushViewController(viewController, animated: animated)
        }
    }
}

enum NavigationStyle {
    
    case push
    case present
}
