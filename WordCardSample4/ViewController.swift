//
//  ViewController.swift
//  WordCardSample4
//
//  Created by Keita Watanabe on 2019/07/20.
//  Copyright © 2019 Keita Watanabe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var todoList: [String]?
    private var identifier = "todoCell"
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoList = []
        todoList = userDefaults.stringArray(forKey: "todo") ?? []
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        guard let todolist = todoList else {
            return cell
        }
        cell.textLabel?.text = todolist[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            todoList?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            userDefaults.set(todoList, forKey: "todo")
            userDefaults.synchronize()
        }
    }
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        guard let addTodoViewController = storyboard?.instantiateViewController(withIdentifier: "AddTodoViewController") as? AddTodoViewController else {
            return
        }
        present(addTodoViewController, animated: true, completion: nil)
    }
    
}

