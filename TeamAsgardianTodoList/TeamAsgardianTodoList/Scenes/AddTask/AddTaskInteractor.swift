//
//  AddTaskInteractor.swift
//  TeamAsgardianTodoList
//
//  Created by Mariam on 16/10/2020.
//

import Foundation

protocol AddTaskBusinessLogic {
    func saveTask(task: Task)
}

class AddTaskInteractor: AddTaskBusinessLogic {
    var presenter: AddTaskPresentationLogic?
    
    func saveTask(task: Task) {
        TodoWorker().saveTodo(todo: task)
        presenter?.presentTodo(task: task)
    }
}
