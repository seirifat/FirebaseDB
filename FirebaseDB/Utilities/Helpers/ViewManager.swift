//
//  ViewManager.swift
//
//  Created by Rifat Firdaus on 4/3/18.
//  Copyright © 2018 Suitmedia. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class ViewManager: NSObject {

    static func createNavbar(color: UIColor?, alpha: CGFloat) -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64)
        view.backgroundColor = color ?? .black
        view.alpha = alpha
        return view
    }
    
    static func createNavigationController(rootController controller: UIViewController, transparent: Bool = false) -> UINavigationController {
        let nav = UINavigationController(rootViewController: controller)
        nav.navigationBar.barStyle = .black
//        nav.navigationBar.tintColor = UIColor.black
        if transparent {
            nav.navigationBar.backgroundColor = nil
            nav.navigationBar.setBackgroundImage(UIImage(), for: .default)
            nav.navigationBar.shadowImage = UIImage()
            nav.navigationBar.isTranslucent = true
        } else {
            nav.navigationBar.isTranslucent = false
            nav.navigationBar.barTintColor = SMUITheme.navBgColor
            nav.navigationBar.tintColor = SMUITheme.navTintColor
        }
        return nav
    }
    
    static func createLoadingFullScreen(offset: Int = 0) -> UIView {
        let container = UIView()
        container.backgroundColor = UIColor.white
        let stackContainer = UIStackView()
        stackContainer.alignment = .center
        stackContainer.axis = .vertical
        container.addSubview(stackContainer)
        stackContainer.translatesAutoresizingMaskIntoConstraints = false
        container.addConstraintsWithFormat("H:|-0-[v0]-0-|", views: stackContainer)
        container.addConstraintsWithFormat("V:|-0-[v0]-\(offset)-|", views: stackContainer)
        
        let spiner = UIActivityIndicatorView()
        spiner.color = UIColor.darkGray
        stackContainer.addArrangedSubview(spiner)
        
        spiner.startAnimating()
        return container
    }
    
    static func addSubView(loadingView: UIView, to view: UIView) {
        view.addSubview(loadingView)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraintsWithFormat("H:|-0-[v0]-0-|", views: loadingView)
        view.addConstraintsWithFormat("V:|-0-[v0]-0-|", views: loadingView)
    }
    
    static func createLoadingNavbar() -> UIView {
        let container = UIView()
        container.backgroundColor = UIColor.white
        let stackContainer = UIStackView()
        stackContainer.alignment = .fill
        stackContainer.axis = .vertical
//        stackContainer.layoutMargins = UIEdgeInsetsMake(0, 0, 200, 0)
        container.addSubview(stackContainer)
        stackContainer.translatesAutoresizingMaskIntoConstraints = false
        container.addConstraintsWithFormat("H:|-0-[v0]-(0)-|", views: stackContainer)
        container.addConstraintsWithFormat("V:|-0-[v0]-(32)-|", views: stackContainer)
        
        let spiner = UIActivityIndicatorView()
        spiner.color = UIColor.darkGray
        stackContainer.addArrangedSubview(spiner)
        spiner.translatesAutoresizingMaskIntoConstraints = false
        stackContainer.addConstraintsWithFormat("H:[v0(100@999)]", views: spiner)
        stackContainer.addConstraintsWithFormat("V:[v0(100@999)]", views: spiner)
        
        spiner.startAnimating()
        return container
    }
    
    static func createEmptyState(controller: UIViewController, action: Selector) -> UIView {
        let container = UIView()
        container.backgroundColor = UIColor(hex: 0xF4F4F4)
        let stackContainer = UIStackView()
        stackContainer.alignment = .fill
        stackContainer.axis = .vertical
        //        stackContainer.layoutMargins = UIEdgeInsetsMake(0, 0, 200, 0)
        container.addSubview(stackContainer)
        stackContainer.translatesAutoresizingMaskIntoConstraints = false
        container.addConstraintsWithFormat("H:|-0-[v0]-(0)-|", views: stackContainer)
        container.addConstraintsWithFormat("V:|-(>=0)-[v0]-(>=0)-|", views: stackContainer)
        stackContainer.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
        
        let stackImage = UIStackView()
        stackImage.alignment = .center
        stackImage.axis = .vertical
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "ic_person")
        stackImage.addArrangedSubview(imageView)
        stackImage.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        stackImage.addConstraintsWithFormat("H:[v0(100@999)]", views: imageView)
        stackImage.addConstraintsWithFormat("V:[v0(100@999)]", views: imageView)
        stackContainer.addArrangedSubview(stackImage)
        
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 12)
        text.textColor = UIColor.lightGray
        text.numberOfLines = 2
        text.textAlignment = .center
        text.text = "Data belum tersedia"
        stackContainer.addArrangedSubview(text)
        text.translatesAutoresizingMaskIntoConstraints = false
        
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        stackContainer.addArrangedSubview(separator)
        stackContainer.addConstraintsWithFormat("V:[v0(8@999)]", views: separator)
        
        let buttonRefresh = UIButton()
        buttonRefresh.setTitle("Refresh", for: .normal)
        buttonRefresh.setTitleColor(UIColor.black, for: .normal)
        buttonRefresh.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        stackContainer.addArrangedSubview(buttonRefresh)
        buttonRefresh.addTarget(controller, action: action, for: .touchUpInside)
        
        return container
    }
    
    // Picker
    
    static func showDatePicker(title: String, textField: UITextField, dateStringInit: String?, dateFormatData: String = "dd/MM/yyyy", locale: Locale? = nil, donePick: @escaping (_ dateData: String, _ dateView: String, _ selectedDate: Date) -> Void) {
        var datePicker: ActionSheetDatePicker = ActionSheetDatePicker()
        var birthDate = Date()
        if let dateStringInit = dateStringInit {
            let formatter = DateFormatter()
            formatter.dateFormat = dateFormatData
            if let dates = formatter.date(from: dateStringInit) {
                birthDate = dates
            }
        }
        datePicker = ActionSheetDatePicker(title: title, datePickerMode: .date, selectedDate: birthDate, doneBlock: { (picker, selectedDate, origin) in
            if let date = selectedDate as? Date {
                let formatter = DateFormatter()
                formatter.dateFormat = dateFormatData
                let dateData = formatter.string(from: date)
                let dateView = date.indonesianFormat(showDay: false)
                donePick(dateData, dateView, date)
            }
        }, cancel: { picker in
            
        }, origin: textField)
        let minFormatter = DateFormatter()
        minFormatter.dateFormat = "dd/mm/yyyy"
        if let minDate = minFormatter.date(from: "01/01/1900") {
            datePicker.minimumDate = minDate
        }
        datePicker.maximumDate = Date()
        if let locale = locale {
            datePicker.locale = locale
        }
        datePicker.show()
    }
    
    static func showImagePickerSheetMenu(tag: Int, controller: UIViewController, delegate: (UIImagePickerControllerDelegate & UINavigationControllerDelegate)) {
        let actionSheet = UIAlertController(title: "Upload Photo", message: "", preferredStyle: UIAlertController.Style.actionSheet)
        let cancelButton = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: { sheet in
            actionSheet.dismiss(animated: true, completion: nil)
        })
        let galleryButton = UIAlertAction(title: "Open Gallery", style: UIAlertAction.Style.default, handler: { sheet in
            ViewManager.galleryPicker(tag: tag, controller: controller, delegate: delegate)
        })
        let cameraButton = UIAlertAction(title: "Take a photo", style: UIAlertAction.Style.default, handler: { sheet in
            ViewManager.takePhotoCapture(tag: tag, controller: controller, delegate: delegate)
        })
        actionSheet.addAction(cancelButton)
        actionSheet.addAction(cameraButton)
        actionSheet.addAction(galleryButton)
        //        actionSheet.view.tintColor = UIColor.black
        controller.present(actionSheet, animated: true, completion: nil)
    }
    
    static func galleryPicker(tag: Int, controller: UIViewController, delegate: (UIImagePickerControllerDelegate & UINavigationControllerDelegate)) {
        //        UIApplication.shared.keyWindow?.tintColor = UIColor.primary()
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = delegate
        imagePicker.view.tag = tag
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        controller.present(imagePicker, animated: true, completion: nil)
    }
    
    static func takePhotoCapture(tag: Int, controller: UIViewController, delegate: (UIImagePickerControllerDelegate & UINavigationControllerDelegate)) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.view.tag = tag
            imagePicker.delegate = delegate
            imagePicker.allowsEditing = false
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.cameraCaptureMode = .photo
            imagePicker.modalPresentationStyle = .fullScreen
            controller.present(imagePicker,animated: true,completion: nil)
        } else {
            noCamera(controller: controller)
        }
    }
    
    static func noCamera(controller: UIViewController){
        let alertVC = UIAlertController(
            title: "No Camera",
            message: "Sorry, this device has no camera",
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style:.default,
            handler: nil)
        alertVC.addAction(okAction)
        controller.present(
            alertVC,
            animated: true,
            completion: nil)
    }
}
