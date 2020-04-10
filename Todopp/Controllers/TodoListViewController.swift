//
//  ViewController.swift
//  Todopp
//
//  Created by Mehmet Eroğlu on 9.04.2020.
//  Copyright © 2020 Mehmet Eroğlu. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("File Path: ", filePath)
        
//        let newItem1 = Item()
//        newItem1.title = "hello world"
//        newItem1.done = true
//
//        let newItem2 = Item()
//        newItem2.title = "merhaba dunya"
//        newItem2.done = false
//
//        let newItem3 = Item()
//        newItem3.title = "hola planet"
//        newItem3.done = true
//        
//        itemArray.append(newItem1)
//        itemArray.append(newItem2)
//        itemArray.append(newItem3)
        
        loadData()
        
    }
    
    func loadData() {
        if let data = try? Data(contentsOf: filePath!) {
            let decoder = PropertyListDecoder()
            do {
                itemArray = try decoder.decode([Item].self, from: data)
            } catch {
                print("Error decoding item array, \(error)")
            }
        }
    }

    // Add new items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todo Item ", message: "", preferredStyle: .alert)
       
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            
            self.saveItem()
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    fileprivate func saveItem() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(itemArray)
            try data.write(to: filePath!)
        } catch {
            print("Error encoding item array, \(error)")
        }
        
        self.tableView.reloadData()
    }

    // MARK: - UITableViewDataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        return cell
    }
    
    // MARK: - UITableViewDelegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentItem = itemArray[indexPath.row]
        currentItem.done.toggle()
        self.saveItem()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

