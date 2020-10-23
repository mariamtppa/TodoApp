//
//  UIViewController+Extension.swift
//  TeamAsgardianTodoList
//
//  Created by David U. Okonkwo on 10/9/20.
//

import UIKit
extension UIViewController {
    func hideKeyboard() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
}
