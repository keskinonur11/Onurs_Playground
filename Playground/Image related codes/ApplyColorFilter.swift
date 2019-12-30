//
//  ApplyColorFilter.swift
//  Playground
//
//  Created by Onur Keskin on 16.12.2019.
//  Copyright © 2019 Onur Keskin. All rights reserved.
//

import Foundation
import UIKit

class ApplyColorFilter {
    static let shared = ApplyColorFilter() //for singleton purpose
    
    private init() {}
    
    func applyFilter(image: CGImage, red: CGFloat, green: CGFloat, blue: CGFloat, inputDensity: CGFloat) -> UIImage {
        var returningProcessedImage = UIImage()
        let currentCGImage = image
        let currentCIImage = CIImage(cgImage: currentCGImage)
        
        let filter = CIFilter(name: "CIColorMonochrome")
        filter?.setValue(currentCIImage, forKey: "inputImage")
        
        // set a value for the tint color
        filter?.setValue(CIColor(red: red, green: green, blue: blue), forKey: "inputColor")
        
        filter?.setValue(inputDensity, forKey: "inputIntensity")
        guard let outputImage = filter?.outputImage else { return returningProcessedImage }
        
        let context = CIContext()
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let processedImage = UIImage(cgImage: cgimg)
            print(processedImage.size)
            returningProcessedImage = processedImage
            return returningProcessedImage
        }
        
        return returningProcessedImage
    }
}
