//
//  SMEngineServiceFirebaseDb.swift
//  FirebaseDB
//
//  Created by Rifat Firdaus on 23/01/19.
//  Copyright © 2019 Rifat Firdaus. All rights reserved.
//

import Foundation
import Firebase

class SMEngineServiceFirebaseDb: NSObject {

    public static let instance = SMEngineServiceFirebaseDb()
    
    private let dbFirebase: Firestore!
    private let userRefListener: CollectionReference!
    private let articleRefListener: CollectionReference!
    
    override init() {
        dbFirebase = Firestore.firestore()
        
        userRefListener = dbFirebase.collection("users")
        articleRefListener = dbFirebase.collection("articles")
    }

    func addOrUpdateUser(documentId: String, dictionary: [String: Any], success: @escaping () -> (), failure: @escaping (Error) -> ()) {
        userRefListener.document(documentId).setData(dictionary, completion: { (error) in
                if let error = error {
                    print("Error adding document: \(error)")
                    failure(error)
                } else {
                    print("Document added")
                    success()
                }
        })
    }
    
    func addArticle(documentId: String, dictionary: [String: Any], success: @escaping (String?) -> (), failure: @escaping (Error) -> ()) {
        var ref: DocumentReference? = nil
        ref = articleRefListener.addDocument(data: dictionary) { (error) in
            if let error = error {
                print("Error adding document: \(error)")
                failure(error)
            } else {
                print("Document added \(ref?.documentID ?? "-")")
                success(ref?.documentID)
            }
        }
    }
    
    func readArticlesListener(success: @escaping ([QueryDocumentSnapshot]) -> (), failure: @escaping (Error) -> ()) -> ListenerRegistration {
        let listener = dbFirebase.collection("articles").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(error!)")
                failure(error!)
                return
            }
            success(documents)
        }
        return listener
    }
}
