//
//  AddTaskPresenter.swift
//  TeamAsgardianTodoList
//
//  Created by Mariam on 16/10/2020.
//

import Foundation

protocol AddTaskPresentationLogic {
    func presentTodo(task: Task)
}

class AddTaskPresenter: AddTaskPresentationLogic {
    var view: AddTaskDisplayLogic?
    
    func presentTodo(task: Task) {
        view?.displayTask(task: task)
    }
}
