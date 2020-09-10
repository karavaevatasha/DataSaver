//
//  RealmViewController.swift
//  WorkWithSavingData
//
//  Created by Nataliia on 10.09.2020.
//  Copyright © 2020 Natalia. All rights reserved.
//

import UIKit
import RealmSwift

var todos: Results<ToDo>!
var realm = try! Realm()

class RealmViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var todoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todos = realm.objects(ToDo.self)
        todoTableView.dataSource = self
        todoTableView.delegate = self
        reload()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reload()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CellClick" {
            let destination = segue.destination as! InsertToDoItemsVC
            let todo = todos[todoTableView.indexPathForSelectedRow!.row]
            destination.incomingToDo = todo
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoCell
        let todo = todos[indexPath.row]
        cell.todoText.text = todo.ToDoText
        cell.isDoneText.text = todo.IsDone ? "It's done" : "Do it"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

    func reload() {
        todoTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            try? realm.write {
                realm.delete(todos[indexPath.row])
            }
            reload()
        }
    }
    
}

class ToDo: Object {
   dynamic var ToDoText = ""
   dynamic var IsDone =  false
}

class ToDoCell: UITableViewCell {
    
    @IBOutlet weak var todoText: UILabel!
    @IBOutlet weak var isDoneText: UILabel!
}

