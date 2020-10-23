//
//  TodoPresenter.swift
//  TeamAsgardianTodoList
//
//  Created by Mariam on 16/10/2020.
//

import Foundation

protocol DisplayTaskDetailsPresentationLogic {
    func presentTodo(task: Task)
}

class DisplayTaskDetailsPresenter: DisplayTaskDetailsPresentationLogic {
    var view: DisplayTaskDetailsDisplayLogic?
    
    func presentTodo(task: Task) {
        view?.displayTodo(task: task)
    }
}
