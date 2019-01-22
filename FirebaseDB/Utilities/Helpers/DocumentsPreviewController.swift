//
//  DocumentsPreviewController.swift
//
//  Created by Rifat Firdaus on 9/25/16.
//  Copyright © 2016 Suitmedia. All rights reserved.
//

import UIKit
import QuickLook


class DocumentsPreviewController: QLPreviewController {

    private var url: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let viewBg = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))
        viewBg.backgroundColor = UIColor.black
        self.view.addSubview(viewBg)
        viewBg.layer.zPosition = -5
    }
    
    override func viewDidLayoutSubviews() {
        navigationItem.rightBarButtonItems?[0] = UIBarButtonItem()
    }
    
    func showPreview(controller: UIViewController, url: URL) {
        // Refreshing the view
        self.reloadData()
        // Printing the doc
        self.url = url
        self.dataSource = self
        if let navController = controller.navigationController {
            navController.pushViewController(self, animated: true)
        }
        else {
            controller.show(self, sender: nil)
        }
    }
    
}

extension DocumentsPreviewController: QLPreviewControllerDataSource {
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        guard let url = self.url else {
            fatalError("Invalid URL")
        }
        let previewItem = url as QLPreviewItem
        return previewItem
    }
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
}
