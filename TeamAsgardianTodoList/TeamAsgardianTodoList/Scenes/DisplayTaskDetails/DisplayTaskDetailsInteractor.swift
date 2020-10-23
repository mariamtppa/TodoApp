//
//  Todo interactor.swift
//  TeamAsgardianTodoList
//
//  Created by Mariam on 16/10/2020.
//

import Foundation

protocol DisplayTaskDetailsBusinessLogic {
    func getTask()
    func editTask(taskId: String, title: String, description: String)
}

class DisplayTaskDetailsInteractor: DisplayTaskDetailsBusinessLogic {
    
    var presenter: DisplayTaskDetailsPresentationLogic?
    
    func editTask(taskId: String, title: String, description: String) {
        let editedTask = Task(taskId: taskId, title: title, taskDescription: description)
        TodoWorker().editTodo(todo: editedTask)
    }
    func getTask() {
    }
}
