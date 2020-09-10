//
//  ViewController.swift
//  WorkWithSavingData
//
//  Created by Nataliia on 10.09.2020.
//  Copyright © 2020 Natalia. All rights reserved.
//
//   Два текстовых поля для имени и фамилии, которые сохраняют введенные данные в UserDefaults, а при повторном запуске приложения показывают последнее введенные строки
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var surnameTF: UITextField!
    @IBAction func saveButton(_ sender: Any) {
        Persistance.shared.userName = nameTF.text
        Persistance.shared.userSurname = surnameTF.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Persistance.shared.userName as Any)
        print(Persistance.shared.userSurname as Any)
        
        self.title = "UserDefaults"
    }
}
