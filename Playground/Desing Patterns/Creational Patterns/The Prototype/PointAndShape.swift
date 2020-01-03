//
//  PointAndShape.swift
//  Playground
//
//  Created by Onur Keskin on 24.12.2019.
//  Copyright © 2019 Onur Keskin. All rights reserved.
//

// Deep copying implemented -> class (reference type) contains another class as property which is also a reference type. If we don't add NSCopying to Shape class then when Point is copied and both objets will refer to the same Shape property and any change will reflect on each other.

// If sharin data is not important then shallow copying is the way

// Value types already gets copied so no need to implement prototype for them

import Foundation

class Point: NSCopying, CustomStringConvertible {
    var x, y: Int
    var shape: Shape
    
    init(x: Int, y: Int, shape: Shape) {
        self.x = x
        self.y = y
        self.shape = shape
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Point(x: self.x, y: self.y, shape: self.shape.copy() as! Shape)
    }
    
    var description: String {
        return "Point (\(x), \(y), \(shape))"
    }
}

class Shape: NSCopying, CustomStringConvertible {
    var type: String
    var size: Int
    
    init(type: String, size: Int) {
        self.type = type
        self.size = size
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Shape(type: self.type, size: self.size)
    }
    
    var description: String {
        return "Shape (\(type), \(size))"
    }
    
    
}
