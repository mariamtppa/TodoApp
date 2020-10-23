//
//  TaskModel.swift
//  TeamAsgardianTodoList
//
//  Created by Mariam on 13/10/2020.
//

import Foundation
import RealmSwift

class Task: Object {
    @objc dynamic var taskId = ""
    @objc dynamic var title = ""
    @objc  dynamic var taskDescription = ""
    override static func primaryKey() -> String? {
        return "taskId"
    }

    convenience init(taskId: String, title: String, taskDescription: String) {
        self.init()
        self.taskId = taskId
        self.title = title
        self.taskDescription = taskDescription
    }
}
