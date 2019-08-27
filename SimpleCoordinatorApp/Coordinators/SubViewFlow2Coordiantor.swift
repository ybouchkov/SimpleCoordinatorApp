//
//  SubViewFlow2Coordiantor.swift
//  SimpleCoordinatorApp
//
//  Created by Yani Buchkov on 26.08.19.
//  Copyright © 2019 MobileBGTeam. All rights reserved.
//

import UIKit

class SubViewFlow2Coordinator: NSObject, Coordinator {
    
    // MARK: - Coordinator
    
    var navigationController: UINavigationController
    
    var childCoordinators: [Constants.CoordinatorKeys : Coordinator]
    
    private var preferredNavigationStyle: NavigationStyle
    
    private var removeCoordinatorWhenDissmied: ((Coordinator) -> ())
    
    // MARK: - Initializer
    
    init(navigationController: UINavigationController,
         preferredNavigationStyle: NavigationStyle,
         removeCoordinatorWhenDissmied: @escaping ((Coordinator) -> ())) {
        
        self.navigationController = navigationController
        self.childCoordinators = [:]
        self.removeCoordinatorWhenDissmied = removeCoordinatorWhenDissmied
        self.preferredNavigationStyle = preferredNavigationStyle
        
        super.init()
        
        start()
    }
    
    func start() {
        let subFlow2ViewController = SubViewFlow2ViewController.loadFromNib()
        navigate(to: subFlow2ViewController, with: preferredNavigationStyle, animated: true)
    }
}
