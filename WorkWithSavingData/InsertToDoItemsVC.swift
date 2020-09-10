//
//  InsertToDoItemsVC.swift
//  WorkWithSavingData
//
//  Created by Nataliia on 10.09.2020.
//  Copyright © 2020 Natalia. All rights reserved.
//

import UIKit
import RealmSwift

class InsertToDoItemsVC: UIViewController {
    
    var incomingToDo: ToDo? = nil
    let realm = try! Realm()
    
    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var todoSwitch: UISwitch!
    @IBAction func saveButtonAction(_ sender: Any) {
        
        if let goodToDo = incomingToDo {
            try! realm.write {
                goodToDo.IsDone = todoSwitch.isOn
                goodToDo.ToDoText = todoTextField.text!
            }
        } else {
            let todo = ToDo()
            todo.ToDoText = todoTextField.text!
            todo.IsDone = todoSwitch.isOn
            try! realm.write {
                realm.add(todo)
            }
        }
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let goodToDo = incomingToDo {
            todoTextField.text = goodToDo.ToDoText
            todoSwitch.isOn = goodToDo.IsDone
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
