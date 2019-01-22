//
//  SMEngine.swift
//  FirebaseDB
//
//  Created by Rifat Firdaus on 10/1/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

// Engine Version 1.0.0 January 09, 2018
// Last project: None

import Foundation
import RealmSwift

public class SMEngine: NSObject {
    
    public static func setup() {
        var config = Realm.Configuration(
            schemaVersion: 1,
            migrationBlock: { (migration, oldSchemaVersion) in
                if (oldSchemaVersion < 1) {
                    print("<<REALM: PROVIDED SCHEMA VERSION IS LESS THAN LAST SET VERSION>>")
                }
        }, deleteRealmIfMigrationNeeded: true, objectTypes: nil)
        do {
            let userDirectory = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first!
            let dataPath = userDirectory.appendingPathComponent("CoreConfig")
            try FileManager.default.createDirectory(atPath: dataPath.path, withIntermediateDirectories: true, attributes: nil)
            config.fileURL = dataPath.appendingPathComponent("dbcore.realm")
            Realm.Configuration.defaultConfiguration = config
            let _ = try Realm()
            print(config.fileURL!.absoluteString)
        } catch {
            print("ERROR REALM DIR")
        }
        SMEngineService.instance.home = BaseURL.url
    }
    
}
