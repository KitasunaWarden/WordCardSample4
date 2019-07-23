//
//  AddTodoViewController.swift
//  WordCardSample4
//
//  Created by Keita Watanabe on 2019/07/23.
//  Copyright © 2019 Keita Watanabe. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var cancelButton: UIButton!
    
    
    private var todoList = [String]()
    
    let userDefault = UserDefaults.standard
    
    @IBAction func cancel() {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoList = userDefault.stringArray(forKey: "todo") ?? []
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func save(_ sender: Any) {
        todoList = userDefault.stringArray(forKey: "todo") ?? []
        if let textField = titleTextField {
            self.todoList.insert(textField.text!, at: 0)
        }
        userDefault.set(self.todoList, forKey: "todo")
        userDefault.synchronize()
        print("Success synchronized!")
    }

    
}
