//
//  NewsListPresenter.swift
//  FirebaseDB
//
//  Created by Rifat Firdaus on 23/01/19.
//  Copyright © 2019 Rifat Firdaus. All rights reserved.
//

import UIKit
import Firebase

class NewsListPresenter: FirebasePresenter {

    var view: BaseViewProtocol?
    var data = [ArticleFirebase]()
    var dataListener: ListenerRegistration!
    
    func setDataListener() {
        dataListener = service.readArticlesListener(success: { [weak self] (documents) in
            self?.data.removeAll()
            documents.forEach({ (snapshot) in
                let item = ArticleFirebase(documentID: snapshot.documentID, dictionary: snapshot.data())
                self?.data.append(item)
            })
            self?.view?.showData()
        }, failure: { [weak self] (error) in
            self?.view?.showError(error: error)
        })
    }
    
    func removeListener() {
        if dataListener != nil {
            dataListener.remove()
        }
    }
    
}
