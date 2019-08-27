//
//  SubViewFromViewFlow1ViewController.swift
//  SimpleCoordinatorApp
//
//  Created by Yani Buchkov on 27.08.19.
//  Copyright © 2019 MobileBGTeam. All rights reserved.
//

import UIKit

class SubViewFromViewFlow1ViewController: UIViewController {
    
    // MARK: - IBOutlets & Properties
    
    @IBOutlet private weak var lblTitle: UILabel!
    
    let titleText: String
    
    // MARK: - Initializer
    
    init(titleText: String) {
        self.titleText = titleText
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SubViewFromFlow1"
        self.lblTitle.text = titleText
    }
}
