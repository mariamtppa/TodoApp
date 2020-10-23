//
//  DisplayTaskTitlesInteractor.swift
//  TeamAsgardianTodoList
//
//  Created by Mariam on 16/10/2020.
//

import Foundation

protocol DisplayTasksTitlesBusinessLogic {
    func getTaskTitles()
    func deleteTask(task: Task)
}

class DisplayTaskTitlesInteractor: DisplayTasksTitlesBusinessLogic {
    
    var presenter: DisplayTasksTitlesPresentationLogic?
    var tasksList: [Task]?
    
    func deleteTask(task: Task) {
        TodoWorker().deleteTodo(todo: task)
        presenter?.deleteTask(task: task)
    }
    
    func getTaskTitles() {
        tasksList = TodoWorker().retrieveTodo()
        presenter?.presentTaskTitles(taskList: tasksList)
    }
}

