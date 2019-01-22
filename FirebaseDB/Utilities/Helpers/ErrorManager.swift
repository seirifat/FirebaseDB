//
//  ErrorManager.swift
//
//  Created by Bungkhus on 3/16/17.
//  Copyright © 2017 Suitmedia. All rights reserved.
//

class ErrorManager {
    
    static func logErrorPlace(file: String, line: Int) -> String {
        return "error in file \(file) in line \(line): "
    }

}
