//
//  ProfileViewController.swift
//  FirebaseDB
//
//  Created by Rifat Firdaus on 13/12/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

import UIKit
import SVProgressHUD
import ActionSheetPicker_3_0
import TPKeyboardAvoiding

class EditProfileViewController: UIViewController {

    @IBOutlet private weak var imageViewPhoto: UIImageView!
    @IBOutlet private weak var textFieldName: UITextField!
    @IBOutlet private weak var textFieldBirthDate: UITextField!
    @IBOutlet private weak var textFieldEmail: UITextField!
    @IBOutlet private weak var textFieldPhone: UITextField!
    @IBOutlet private weak var viewContainer: UIView!
    @IBOutlet private weak var stackViewProfile: UIStackView!
    
    var dateParam: String? = "1989-10-06"
    
    static func instantiate() -> EditProfileViewController {
        let controller = EditProfileViewController(nibName: self.className(), bundle: nil)
        return controller
    }
    
    static func instantiateNav() -> UINavigationController {
        let controller = EditProfileViewController(nibName: self.className(), bundle: nil)
        let nav = ViewManager.createNavigationController(rootController: controller, transparent: false)
        return nav
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackBarButtonItems()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.parent?.title = "Profile"
    }
    
    @IBAction private func buttonSavePressed(_ sender: UIButton) {
        SVProgressHUD.showSuccess(withStatus: "Success!")
    }
    
    func setupView() {
        imageViewPhoto.circlifyImage()
        
        textFieldName.placeholder = "Name"
        textFieldBirthDate.placeholder = "Birth Date"
        textFieldEmail.placeholder = "Email"
        textFieldPhone.placeholder = "Phone"
        
        textFieldBirthDate.delegate = self
        
        stackViewProfile.isUserInteractionEnabled = true
        let tapPhoto = SMTapGesture(target: self, action: #selector(imageTapGesture))
        tapPhoto.tag = 1
        stackViewProfile.addGestureRecognizer(tapPhoto)
        
        textFieldName.setBottomLine(borderColor: SMUITheme.primaryColor)
        textFieldBirthDate.setBottomLine(borderColor: SMUITheme.primaryColor)
        textFieldEmail.setBottomLine(borderColor: SMUITheme.primaryColor)
        textFieldPhone.setBottomLine(borderColor: SMUITheme.primaryColor)
        
        textFieldPhone.keyboardType = .numberPad
        textFieldPhone.addDoneButtonOnKeyboard()
        
        textFieldName.text = "Trafalgar D Water Law"
        textFieldBirthDate.text = "6 Oktober 1989"
        textFieldEmail.text = "Torao@gmail.com"
        textFieldPhone.text = "+55 55009982"
        
    }
    
    @objc func imageTapGesture(_ sender: SMTapGesture) {
        ViewManager.showImagePickerSheetMenu(tag: sender.tag, controller: self, delegate: self)
    }
    
}

extension EditProfileViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == textFieldBirthDate {
            view.endEditing(true)
            ViewManager.showDatePicker(title: "Tanggal Lahir", textField: self.textFieldBirthDate, dateStringInit: dateParam, dateFormatData: "yyyy-MM-dd", locale: Locale(identifier: "id"), donePick: { [weak self] dateData, dateView, selectedDate  in
                self?.dateParam = dateData
                self?.textFieldBirthDate.text = dateView
                print(self?.dateParam ?? "")
            })
            return false
        }
        return true
    }
}

extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        imageViewPhoto.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
