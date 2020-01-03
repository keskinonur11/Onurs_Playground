//
//  LaptopBuilder.swift
//  Playground
//
//  Created by Onur Keskin on 24.12.2019.
//  Copyright © 2019 Onur Keskin. All rights reserved.
//

import Foundation

protocol LaptopBuilderProtocol {
    //    mutating func buildParts(configuration: LaptopConfiguration) -> Laptop
    func buildLaptop(configuration: LaptopConfiguration) -> Laptop
}

public class BudgetLaptopBuilder: LaptopBuilderProtocol {
    static let shared = BudgetLaptopBuilder()
    
    init() { }
    
    func buildLaptop(configuration: LaptopConfiguration) -> Laptop {
        return Laptop(size: .thirteenInch, processor: .i5, graphics: .intelUHD617)
    }
}

public class OfficeLaptopBuilder: LaptopBuilderProtocol {
    static let shared = OfficeLaptopBuilder()
    
    init() { }
    
    func buildLaptop(configuration: LaptopConfiguration) -> Laptop {
        return Laptop(size: .fifteenInch, processor: .i7, graphics: .intelIrisPlus645)
    }
}

public class HighEndLaptopBuilder: LaptopBuilderProtocol {
    static let shared = HighEndLaptopBuilder()
    
    init() { }
    
    func buildLaptop(configuration: LaptopConfiguration) -> Laptop {
        return Laptop(size: .fifteenInch, processor: .i9, graphics: .radeonVegaPro20)
    }
}

public class CustomLaptopBuilder: LaptopBuilderProtocol {
    static let shared = CustomLaptopBuilder()
    
    init() { }
    
    func buildLaptop(configuration: LaptopConfiguration) -> Laptop {
        return Laptop(size: configuration.size!, processor: configuration.processor!, graphics: configuration.graphics!)
    }
}

public class LaptopBuilderDirector {
    static let shared = LaptopBuilderDirector()
    private var builder: LaptopBuilderProtocol?
    
    init() { }
    
    func buildALaptop(configuration: LaptopConfiguration) -> Laptop {
        switch configuration.baseModel {
        case .budget:
            builder = BudgetLaptopBuilder.shared
        case .office:
            builder = OfficeLaptopBuilder.shared
        case .highEnd:
            builder = HighEndLaptopBuilder.shared
        default:
            builder = CustomLaptopBuilder.shared
        }
        
        return builder!.buildLaptop(configuration: configuration)
    }
    
}



