//
//  RealmModel.swift
//  WorkWithSavingData
//
//  Created by Nataliia on 11.09.2020.
//  Copyright © 2020 Natalia. All rights reserved.
//

import Foundation
import RealmSwift

class ToDoItems: Object {
    @objc dynamic var ToDoText = ""
    @objc dynamic var IsDone =  false
}

class RealmModel{
    
    static let shared = RealmModel()
    private let realm = try! Realm()
    var incomingToDoItems: ToDoItems? = nil
    
    func getAllItems() -> [ToDoItems] {
        var arrayItems: [ToDoItems] = []
        for item in realm.objects(ToDoItems.self) {
            arrayItems.append(item)
        }
        return arrayItems
    }
    
    func saveItem(todoItem: String, isDoneItem: Bool = false) {
        let todo = ToDoItems()
        todo.ToDoText = todoItem
        todo.IsDone = isDoneItem
        if todo.ToDoText != "" {
            try! realm.write {
                realm.add(todo)
            }
        }
    }
    func deleteItem(name: ToDoItems) {
        try! realm.write {
            realm.delete(name)
        }
    }
    
    func updateTask(editItem: ToDoItems, isDone: Bool) {
        try! realm.write {
            editItem.IsDone = isDone
        }
    }
   
}
