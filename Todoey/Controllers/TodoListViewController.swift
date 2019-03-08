//
//  ViewController.swift
//  Todoey
//
//  Created by Sagar Sarkar on 08/03/19.
//  Copyright © 2019 Sagar Sarkar. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Items]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newItem = Items()
        newItem.title = "Sagar"
        itemArray.append(newItem)
        
        let newItem2 = Items()
        newItem2.title = "Samik"
         itemArray.append(newItem2)
        
        let newItem3 = Items()
        newItem3.title = "Prasun"
         itemArray.append(newItem3)
        
        let newItem4 = Items()
        newItem4.title = "Neil"
         itemArray.append(newItem4)

        

        if let items = defaults.array(forKey: "TodoListArray") as? [Items] {
            itemArray = items
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
  
    //MARK - Table View Datasource method
    
    //cellforRowat
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].title
        
        cell.accessoryType = itemArray[indexPath.row].done == false ? .none : .checkmark
//        if itemArray[indexPath.row].done == false {
//            cell.accessoryType = .none
//        }else {
//             cell.accessoryType = .checkmark
//        }
        
        return cell
    }
    
    //MARK - Table View Delegate Method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        tableView.deselectRow(at: indexPath, animated: true)
//        if itemArray[indexPath.row].done == false {
//            itemArray[indexPath.row].done = true
//
//        }else{
//            itemArray[indexPath.row].done = false
//
//        }
        tableView.reloadData()
      
        
    }
    
    
  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField();
        let alert = UIAlertController(title: "Add New Todoey ITEM", message: "" , preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add ITEM", style: .default) { (action) in
            let newItem = Items()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert,animated: true, completion: nil)
    }
    

}

