//
//  SampTableViewCell.swift
//  SimpleCoordinatorApp
//
//  Created by Yani Buchkov on 27.08.19.
//  Copyright © 2019 MobileBGTeam. All rights reserved.
//

import UIKit

class SampTableViewCell: UITableViewCell {

    // MARK: - IBOutlets & Properties
    
    @IBOutlet weak var lblTextExample: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Setup
    func setup(title: String) {
        lblTextExample.text = title
    }
}
