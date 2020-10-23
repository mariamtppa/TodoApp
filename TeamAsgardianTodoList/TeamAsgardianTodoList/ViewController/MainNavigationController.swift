//
//  MainNavigationController.swift
//  TeamAsgardianTodoList
//
//  Created by Mariam on 10/8/20.

import UIKit

class MainNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let listTodoViewController = DisplayTaskTitlesViewController()
        viewControllers = [listTodoViewController]
    }
}
