//
//  InsertToDoItemsVC.swift
//  WorkWithSavingData
//
//  Created by Nataliia on 10.09.2020.
//  Copyright © 2020 Natalia. All rights reserved.
//

import UIKit

class InsertToDoItemsVC: UIViewController {
    
    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var todoSwitch: UISwitch!
    
    var item: ToDoItems?
    
    @IBAction func saveButtonAction(_ sender: Any) {
        RealmModel.shared.saveItem(todoItem: todoTextField.text!, isDoneItem: todoSwitch.isOn)
        
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let goodToDo = item {
            todoTextField.text = goodToDo.ToDoText
            todoSwitch.isOn = goodToDo.IsDone
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
