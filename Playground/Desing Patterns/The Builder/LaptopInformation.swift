//
//  LaptopInformation.swift
//  Playground
//
//  Created by Onur Keskin on 24.12.2019.
//  Copyright © 2019 Onur Keskin. All rights reserved.
//

import Foundation

public class Laptop: CustomStringConvertible {
    var size: Size
    var processor: Processor
    var graphics: Graphics    
    
    init(size: Size, processor: Processor, graphics: Graphics) {
        self.size = size
        self.processor = processor
        self.graphics = graphics
    }
    
    public var description: String {
        return "Laptop: \(size), \(processor), \(graphics) \n"
    }
}

enum Size: String, CustomStringConvertible {
    case thirteenInch = "13-inch"
    case fifteenInch = "15-inch"
    
    var description: String {
        return self.rawValue
    }
    
    public func getSize(size: String) -> Size {
        switch size {
        case Size.thirteenInch.description:
            return Size.thirteenInch
        case Size.fifteenInch.description:
            return Size.fifteenInch
        default:
            return Size.thirteenInch
        }
    }
}

enum Processor: String, CustomStringConvertible {
    case i5 = "Intel Core i5"
    case i7 = "Intel Core i7"
    case i9 = "Intel Core i9"
    
    var description: String {
        return self.rawValue
    }
    
    public func getProcessor(processor: String) -> Processor {
        switch processor {
        case Processor.i5.description:
            return Processor.i5
        case Processor.i7.description:
            return Processor.i7
        case Processor.i9.description:
            return Processor.i9
        default:
            return Processor.i5
        }
    }
}

enum Graphics: String, CustomStringConvertible {
    case intelUHD617 = "Intel UHD Graphics 617"
    case intelIrisPlus645 = "Intel Iris Plus Graphics 645"
    case radeonVegaPro20 = "Radeon Pro Vega 20"
    
    var description: String {
        return self.rawValue
    }
    
    public func getGraphics(graphics: String) -> Graphics {
           switch graphics {
           case Graphics.intelUHD617.description:
               return Graphics.intelUHD617
           case Graphics.intelIrisPlus645.description:
               return Graphics.intelIrisPlus645
           case Graphics.radeonVegaPro20.description:
               return Graphics.radeonVegaPro20
           default:
               return Graphics.intelUHD617
           }
       }
}

enum LaptopBaseModel: String, CustomStringConvertible {
    case budget = "Budget"
    case office = "Office"
    case highEnd = "HighEnd"
    
    var description: String {
        return self.rawValue
    }
    
    public func getBaseModel(baseModel: String) -> LaptopBaseModel? {
        switch baseModel {
        case LaptopBaseModel.budget.description:
            return LaptopBaseModel.budget
        case LaptopBaseModel.office.description:
            return LaptopBaseModel.office
        case LaptopBaseModel.highEnd.description:
            return LaptopBaseModel.highEnd
        default:
            return nil
        }
    }
}

public class LaptopConfiguration {
    var size: Size?
    var processor: Processor?
    var graphics: Graphics?
    var baseModel: LaptopBaseModel?
    
    init(size: Size?, processor: Processor?, graphics: Graphics?, baseModel: LaptopBaseModel?) {
        self.size = size
        self.processor = processor
        self.graphics = graphics
        self.baseModel = baseModel
    }
}
