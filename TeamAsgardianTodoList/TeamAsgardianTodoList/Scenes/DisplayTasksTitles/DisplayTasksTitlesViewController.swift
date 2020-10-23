//
//  TodoListViewController.swift
//  TeamAsgardianTodoList
//  Created by Mariam on 10/8/20.

import UIKit

protocol TasksTitlesDisplayLogic {
    func displayTaskTitlesInTableView(taskTitles: [Task]?)
    func displayDeletedTask(task: Task)
}

class DisplayTaskTitlesViewController: UITableViewController, TasksTitlesDisplayLogic {
    
    var taskList: [Task]?
    var interactor: DisplayTasksTitlesBusinessLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: StringConstants.cellId)
        let presenter = DisplayTasksTitlesPresenter()
        let interactor = DisplayTaskTitlesInteractor()
        presenter.view = self
        interactor.presenter = presenter
        self.interactor = interactor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        interactor?.getTaskTitles()
        tableView.reloadData()
    }
    
    func setNavigationBar() {
        navigationItem.title = StringConstants.todoListScreenTitle
        let addButton = UIButton(type: .custom)
        addButton.setTitle(StringConstants.addButtonText, for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        addButton.addTarget(self, action: #selector(addTodo), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addButton)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StringConstants.cellId) else { return UITableViewCell() }
        cell.textLabel?.text = taskList?[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            interactor?.deleteTask(task: taskList?[indexPath.row] ?? Task())
            self.taskList?.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todoDetailViewController = DisplayTaskDetailsViewController()
        let task = Task(taskId: taskList?[indexPath.row].taskId ?? StringConstants.emptyString, title: taskList?[indexPath.row].title ?? StringConstants.emptyString, taskDescription: taskList?[indexPath.row].taskDescription ?? StringConstants.emptyString)
        todoDetailViewController.displayTask = task
        navigationController?.pushViewController(todoDetailViewController, animated: true)
    }
    
    func displayTaskTitlesInTableView(taskTitles: [Task]?) {
        taskList = taskTitles
    }
    
    func displayDeletedTask(task: Task) {
        tableView.reloadData()
      }
    
    @objc func addTodo() {
        let viewController = AddTaskViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
