//
//  AlertHelper.swift
//
//  Created by Rifat Firdaus on 5/21/18.
//  Copyright © 2018 Suitmedia. All rights reserved.
//

import UIKit

class AlertHelper: NSObject {

    static func createAlert(title: String? = nil, message: String? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        return alert
    }
    
    static func createAlertDialog(title: String?, message: String?, agreeText: String = "OK", cancelText: String = "Cancel", agreeHandler: ((UIAlertAction) -> Swift.Void)? = nil, cancelHandler: ((UIAlertAction) -> Swift.Void)? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: agreeText, style: .default, handler: agreeHandler))
        alert.addAction(UIAlertAction(title: cancelText, style: .cancel, handler: cancelHandler))
        alert.view.tintColor = UIColor.black
        return alert
    }
    
    static func createActionSheet(title: String? = nil, message: String? = nil, actions: UIAlertAction...) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        actions.forEach { alertAction in
            alert.addAction(alertAction)
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        //        self.present(alert, animated: true, completion: nil)
        return alert
    }
    
    static func createMessageView(message: String?) -> UIView {
        let container = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        container.backgroundColor = UIColor.white
        let stackContainer = UIStackView(frame: container.frame)
        stackContainer.alignment = .center
        stackContainer.axis = .vertical
        container.addSubview(stackContainer)
        container.addConstraintsWithFormat("H:|-0-[v0]-0-|", views: stackContainer)
        container.addConstraintsWithFormat("V:|-0-[v0]-0-|", views: stackContainer)
        
        let labelMessage = UILabel()
        labelMessage.font = UIFont.systemFont(ofSize: 14)
        labelMessage.textAlignment = .center
        labelMessage.text = message ?? ""
        
        stackContainer.addArrangedSubview(labelMessage)
        
        return container
    }
    
    static func createAlert(title: String? = nil, message: String? = nil, singleAction: Bool = true) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        return alert
    }
    
    static func createTextDialog(title: String?, message: String?, agreeText: String = "OK", cancelText: String = "Cancel", agreeHandler: ((UIAlertAction) -> Swift.Void)? = nil, cancelHandler: ((UIAlertAction) -> Swift.Void)? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.keyboardType = .emailAddress
            textField.placeholder = "Email"
        }
        alert.addAction(UIAlertAction(title: agreeText, style: .default, handler: agreeHandler))
        alert.addAction(UIAlertAction(title: cancelText, style: .cancel, handler: cancelHandler))
        return alert
    }
    
    
}
