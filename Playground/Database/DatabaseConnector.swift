//
//  DatabaseConnector.swift
//  Playground
//
//  Created by Onur Keskin on 4.02.2020.
//  Copyright © 2020 Onur Keskin. All rights reserved.
//

import Foundation
import GRDB
import UIKit

@objcMembers class DatabaseConnector: NSObject {    
    public static var dbQueue: DatabaseQueue!        
    
    static func openDatabase(atPath path: String) throws -> DatabaseQueue  {
        let dbQueue = try DatabaseQueue(path: path)
        return dbQueue
    }
    
    @objc public static func setupDatabase(_ application: UIApplication) throws {
        do{
            let databaseURL = try FileManager.default
            .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("OnursPlaygroundDb.sqlite")
            
            if(!FileManager.default.fileExists(atPath: databaseURL.path)) {
                let dbFilePath = Bundle.main.path(forResource: "OnursPlaygroundDb.sqlite", ofType: nil)
                try FileManager.default.copyItem(atPath: dbFilePath!, toPath: databaseURL.path)
            }
            
            dbQueue = try self.openDatabase(atPath: databaseURL.path)
            
            // Be a nice iOS citizen, and don't consume too much memory
            // See https://github.com/groue/GRDB.swift/blob/master/README.md#memory-management
            dbQueue.setupMemoryManagement(in: application)
        } catch {
            print("Error while copying db.")
        }
    }
    
}
