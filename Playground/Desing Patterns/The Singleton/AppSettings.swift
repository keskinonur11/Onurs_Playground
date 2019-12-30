//
//  AppSettings.swift
//  Playground
//
//  Created by Onur Keskin on 19.12.2019.
//  Copyright © 2019 Onur Keskin. All rights reserved.
//

//Thread safe singleton implentation
//Since there may be an attempt to write/read/reset to settings array at the same time multiple times, we have to make a que of operations
//This q can be a serial or concurrent. Concurrent q can become a serial q at a time with the barrier flag. Thus the client doesn't need to wait in q when multiple read operations wanted
//Edit scheme > thread sanitizer

import Foundation

class AppSettings {
    fileprivate static let dispatchQueLabel = "appSettingsSerialQue"
//    private let serialQue = DispatchQueue(label: dispatchQueLabel)
    private let concurrentQue = DispatchQueue(label: dispatchQueLabel, attributes: .concurrent)
    private var settings: [String: Any] = [:]
    
    static let shared = AppSettings()
    
    private init() {}
    
    public func set(value: Any, forkey key: String) {
        concurrentQue.async(flags: .barrier) {
            self.settings[key] = value
        }
    }
    
    public func object(forKey key: String) -> Any? {
        var result: Any?
        concurrentQue.sync {
            result = settings[key]
        }
        return result
    }
    
    public func reset() {
        settings.removeAll()
    }
}
