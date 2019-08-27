//
//  SubViewFlow1ViewController.swift
//  SimpleCoordinatorApp
//
//  Created by Yani Buchkov on 26.08.19.
//  Copyright © 2019 MobileBGTeam. All rights reserved.
//

import UIKit

class SubViewFlow1ViewController: UIViewController {

    // MARK: - IBOutlets & Properties
    
    // Testing purpose
    var items = [
        "text 1",
        "text 2",
        "text 3",
        "text 4",
        "text 5",
        "text 6",
        "text 7",
        "text 8",
        "text 9",
        "text 10"
    ]
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(UINib(nibName: "SampTableViewCell", bundle: nil), forCellReuseIdentifier: "CellId")
        }
    }
    
    private let tableViewTapped: ((String)->())

    
    // MARK: - Initializer
    
    init(action: @escaping (String) -> ()) {
        self.tableViewTapped = action
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SubViewFlow1"
    }
}

extension SubViewFlow1ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath) as? SampTableViewCell else { return UITableViewCell() }
        cell.setup(title: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? SampTableViewCell else { return }
        tableViewTapped(cell.lblTextExample.text ?? "Empty")
    }
}
