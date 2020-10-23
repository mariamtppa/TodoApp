//
//  DisplayTaskTitleAndDescriptionScreen.swift
//  TeamAsgardianTodoList
//  Created by Mariam Abdulkareem on 09/10/2020.

import UIKit

protocol DisplayTaskDetailsDisplayLogic {
    func displayTodo(task: Task)
}

class DisplayTaskDetailsViewController: UIViewController, DisplayTaskDetailsDisplayLogic {
    
    var interactor: DisplayTaskDetailsBusinessLogic?
    var displayTask: Task?
    
    lazy var taskTitle: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.isEditable = false
        textView.font = UIFont(name: StringConstants.fontFamily, size: 25)
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    lazy var taskDescription: UITextView = {
        let textView = UITextView()
        textView.font = UIFont(name: StringConstants.fontFamily, size: 20)
        textView.textColor = .black
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    lazy var saveTodoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(StringConstants.saveTaskString, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor =  #colorLiteral(red: 0.07057534903, green: 0.07059564441, blue: 0.07057406753, alpha: 1)
        button.layer.cornerRadius = 5
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        button.addTarget(self, action: #selector(editNewTodoButtonClick), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        layoutViews()
        setup()
        interactor?.getTask()
        taskTitle.text = displayTask?.title
        taskDescription.text = displayTask?.taskDescription
    }
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.tintColor = .black
        let addButton = UIButton(type: .custom)
        addButton.setTitle(StringConstants.editTaskString, for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addButton)
        addButton.addTarget(self, action: #selector(handleEditTodoClick), for: .touchUpInside)
    }
    
    func layoutViews() {
        view.addSubview(taskTitle)
        view.addSubview(taskDescription)
        view.addSubview(saveTodoButton)
        setConstraints()
    }
    
    func setup() {
        let presenter = DisplayTaskDetailsPresenter()
        let interactor = DisplayTaskDetailsInteractor()
        presenter.view = self
        interactor.presenter = presenter
        self.interactor = interactor
    }
    
    @objc func editNewTodoButtonClick() {
        interactor?.editTask(taskId: displayTask?.taskId ?? StringConstants.emptyString, title: taskTitle.text, description: taskDescription.text)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleEditTodoClick() {
        taskTitle.layer.borderWidth = 1
        taskTitle.isEditable = true
        taskDescription.layer.borderWidth = 1
        taskDescription.isEditable = true
        saveTodoButton.isHidden = false
    }
    
    func displayTodo(task: Task) {
        taskTitle.text = task.title
        taskDescription.text = task.taskDescription
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            // set task title display constraints
            taskTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            taskTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            taskTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            taskTitle.heightAnchor.constraint(equalToConstant: 50),
            // set task description display constraints
            taskDescription.topAnchor.constraint(equalTo: taskTitle.bottomAnchor, constant: 10),
            taskDescription.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            taskDescription.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            taskDescription.heightAnchor.constraint(equalToConstant: 300),
            // set saveTodoButton display constraints
            saveTodoButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            saveTodoButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            saveTodoButton.topAnchor.constraint(equalTo: taskDescription.bottomAnchor, constant: 50),
            saveTodoButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
