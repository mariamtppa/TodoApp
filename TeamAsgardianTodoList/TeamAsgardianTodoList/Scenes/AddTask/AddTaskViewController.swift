//
//  AddTaskTitleAndDescriptionScreen.swift
//  TeamAsgardianTodoList
//  Created by Mariam Abdulkareem on 08/10/2020.

import UIKit

protocol AddTaskDisplayLogic {
    func displayTask(task: Task)
}

class AddTaskViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate, AddTaskDisplayLogic {
    
    var taskList = TodoWorker().listTodos
    var interactor: AddTaskBusinessLogic?
    
    lazy var taskIdTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = StringConstants.taskIdPlaceholder
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = #colorLiteral(red: 0.9136453867, green: 0.9137768149, blue: 0.9136165977, alpha: 1)
        textField.setLeftPaddingPoints(10)
        textField.setRightPaddingPoints(10)
        return textField
    }()
    
    lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = StringConstants.taskTitleText
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = #colorLiteral(red: 0.9136453867, green: 0.9137768149, blue: 0.9136165977, alpha: 1)
        textField.setLeftPaddingPoints(10)
        textField.setRightPaddingPoints(10)
        return textField
    }()
    
    lazy var descriptionTextField: UITextView = {
        let textField = UITextView()
        textField.textColor = .black
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.layer.borderColor =  #colorLiteral(red: 0.9136453867, green: 0.9137768149, blue: 0.9136165977, alpha: 1)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var saveTaskButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(StringConstants.addButtonText.uppercased(), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor =  #colorLiteral(red: 0.07057534903, green: 0.07059564441, blue: 0.07057406753, alpha: 1)
        button.layer.cornerRadius = 5
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleAddTaskButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        layoutViews()
        setup()
    }
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    func layoutViews() {
        view.addSubview(taskIdTextField)
        view.addSubview(titleTextField)
        view.addSubview(descriptionTextField)
        view.addSubview(saveTaskButton)
        setConstraints()
        hideKeyboard()
    }
    
    func setup() {
        let presenter = AddTaskPresenter()
        let interactor = AddTaskInteractor()
        presenter.view = self
        interactor.presenter = presenter
        self.interactor = interactor
    }
    
    @objc func handleAddTaskButton() {
        let task = Task()
        task.taskId = taskIdTextField.text ?? StringConstants.emptyString
        task.title = titleTextField.text ??  StringConstants.emptyString
        task.taskDescription = descriptionTextField.text ??  StringConstants.emptyString
        interactor?.saveTask(task: task)
    }
    
    func displayTask(task: Task) {
        let alert = UIAlertController(title: StringConstants.successAlertTitle, message: StringConstants.successAlertMessage, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: StringConstants.okString, style: .default) { (action) -> Void in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(action)
        self.navigationController?.present(alert, animated: true, completion: nil)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            taskIdTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            taskIdTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            taskIdTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            taskIdTextField.heightAnchor.constraint(equalToConstant: 50),
            // set title text field constraints
            titleTextField.topAnchor.constraint(equalTo: taskIdTextField.bottomAnchor, constant: 20),
            titleTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            titleTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            titleTextField.heightAnchor.constraint(equalToConstant: 50),
            // set description text field constraints
            descriptionTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            descriptionTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            descriptionTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 300),
            // set save todo button constraints
            saveTaskButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            saveTaskButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            saveTaskButton.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 50),
            saveTaskButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
