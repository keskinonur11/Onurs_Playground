//
//  OperationsManager.swift
//  Playground
//
//  Created by Onur Keskin on 4.02.2020.
//  Copyright © 2020 Onur Keskin. All rights reserved.
//

import Foundation
import GRDB

struct Operations: Codable, FetchableRecord, MutablePersistableRecord {
    var id: Int64
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "Id", name = "FunctionCalled"
    }
}

class OperationsManager {
    static let shared = OperationsManager()
    
    private init() {}
    
    func getOperationsHistory() -> Array<Operations> {
        var operationHistory = [Operations]()
        do {
            try DatabaseConnector.dbQueue.read { db in
                let operations = try Operations.fetchAll(db)
                operationHistory = operations
            }
        } catch {
            print("Error at getOperationHistory")
        }
        return operationHistory
    }
    
    func addToOperations() {
//        player.name = nameTextField.text ?? ""
//               player.score = scoreTextField.text.flatMap { Int($0) } ?? 0
//               self.player = player
//
//               try! dbQueue.inDatabase { db in
//                   try player.save(db)
//               }
    }
}
