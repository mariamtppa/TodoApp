//
//  DisplayTaskTitlesPresenter.swift
//  TeamAsgardianTodoList
//
//  Created by Mariam on 16/10/2020.
//

import Foundation
import RealmSwift

protocol DisplayTasksTitlesPresentationLogic {
    func presentTaskTitles(taskList: [Task]?)
    func deleteTask(task: Task)
}

class DisplayTasksTitlesPresenter: DisplayTasksTitlesPresentationLogic{
    
    var view: TasksTitlesDisplayLogic?
    
    func presentTaskTitles(taskList: [Task]?) {
        view?.displayTaskTitlesInTableView(taskTitles: taskList ?? [Task]())
    }
    
    func deleteTask(task: Task) {
        view?.displayDeletedTask(task: task)
       }
}
