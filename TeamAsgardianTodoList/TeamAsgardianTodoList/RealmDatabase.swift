//
//  RealmDatabase.swift
//  TeamAsgardianTodoList
//
//  Created by Mariam on 14/10/2020.
//

import Foundation
import  RealmSwift

class TodoWorker {
var listTodos: Array<Task>?
    
    func saveTodo(todo: Task) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(todo, update: .all)
            }
        }
        catch {
            print ("Could not access database: ", error)
        }
    }
    
    func editTodo(todo: Task) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(todo, update: .modified)
            }
        }
        catch {
            print ("Could not access database: ", error)
        }
    }
    
    func retrieveTodo() -> Array<Task>? {
        
        do {
            let realm = try Realm()
            listTodos = Array(realm.objects(Task.self))
        }
        catch {
            print ("Could not retrieve from database: ", error)
        }
        return listTodos
    }
    
    func deleteTodo(todo: Task) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(todo)
            }
        }
        catch {
            print ("Could not delete from database: ", error)
        }
    }
}
