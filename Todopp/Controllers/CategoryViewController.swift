//
//  CategoryViewController.swift
//  Todopp
//
//  Created by Mehmet Eroğlu on 10.04.2020.
//  Copyright © 2020 Mehmet Eroğlu. All rights reserved.
//

import UIKit

class CategoryViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

}
