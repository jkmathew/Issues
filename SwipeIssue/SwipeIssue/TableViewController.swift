//
//  TableViewController.swift
//  SwipeIssue
//
//  Created by Johnnykutty Mathew on 27.06.19.
//  Copyright © 2019 Johnnykutty Mathew. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var prefix = ""
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = "\(prefix) - \(indexPath.row)"

        return cell
    }
    

}
