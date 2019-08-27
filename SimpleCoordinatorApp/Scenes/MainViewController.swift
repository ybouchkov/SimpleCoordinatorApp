//
//  MainViewController.swift
//  SimpleCoordinatorApp
//
//  Created by Yani Buchkov on 26.08.19.
//  Copyright © 2019 MobileBGTeam. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - IBOutlets & Properties
    
    @IBOutlet private weak var firstBtn: UIButton!
    @IBOutlet private weak var secondBtn: UIButton!
    
    let button1Tapped: (()->())
    let button2Tapped: (()->())
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "Main View"
    }
    
    // MARK: - Initializer
    
    init(with action1: @escaping (()->()),
         action2: @escaping (()->())) {
        self.button1Tapped = action1
        self.button2Tapped = action2
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    @IBAction
    private func handleFirstTap(_ sender: UIButton) {
        button1Tapped()
    }
    
    @IBAction
    private func handleSecondTap(_ sender: UIButton) {
        button2Tapped()
    }
}
