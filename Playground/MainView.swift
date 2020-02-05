//
//  MainView.swift
//  Playground
//
//  Created by Onur Keskin on 26.11.2019.
//  Copyright © 2019 Onur Keskin. All rights reserved.
//

import Foundation
import UIKit

class MainView: UIViewController {
    
    @IBOutlet weak var batteryImage: UIImageView!
    
    @IBOutlet weak var factoryMethodLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       applyColorFilterToImage()
//        networking()
//        prototypePattern()
//        builderPattern()
//        factoryMethod()
//        adapterPattern()
        getOperationsFromDb()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
        
    func applyColorFilterToImage() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.batteryImage.image = ApplyColorFilter.shared.applyFilter(image: (self.batteryImage.image?.cgImage)!, red: 0, green: 204, blue: 0, inputDensity: 1.0)
        })
    }
    
    func networking() {
        DataService.shared.fetchGists() { (result) in
            switch result {
            case .success(let gists):
                for gist in gists {
                    print("\(gist) \n")
                }
            case .failure(let error):
                print(error)
            }
        }
        
        let newGistObj = Gist(isPublic: true, description: "a new gist", files: ["new_gist.txt": File(content: "Ha Ha")])
        DataService.shared.creteNewGist(newGist: newGistObj) { (result) in
            switch result {
            case .success(let json):
                print(json)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func prototypePattern() {
        let p1 = Point(x: 0, y: 0, shape: Shape(type: "Circle", size: 11))
        let p2 = p1.copy() as! Point
        
        p2.x = 5
        p2.y = 15
        p2.shape.type = "Square"
        p2.shape.size = 75
        
        print("\(p1), \(p2)")
    }
    
    func builderPattern() {
        var config = LaptopConfiguration(size: nil, processor: nil, graphics: nil, baseModel: .budget)
        var myComp = LaptopBuilderDirector.shared.buildALaptop(configuration: config)
        print(myComp)
        
        config = LaptopConfiguration(size: .fifteenInch, processor: .i7, graphics: .radeonVegaPro20, baseModel: nil)
        myComp = LaptopBuilderDirector.shared.buildALaptop(configuration: config)
        print(myComp)
    }
    
    func factoryMethod() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            let purpleTheme = ThemeCreator.makeTheme(profile: .purple)
            self.factoryMethodLabel.backgroundColor = purpleTheme.backgroundColor
            self.factoryMethodLabel.textColor = purpleTheme.textColor
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4, execute: {
            let darkTheme = ThemeCreator.makeTheme(profile: .dark)
            self.factoryMethodLabel.backgroundColor = darkTheme.backgroundColor
            self.factoryMethodLabel.textColor = darkTheme.textColor
        })
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6, execute: {
            let blueTheme = ThemeCreator.makeTheme(profile: .blue)
            self.factoryMethodLabel.backgroundColor = blueTheme.backgroundColor
            self.factoryMethodLabel.textColor = blueTheme.textColor
        })
    }
    
    func adapterPattern() {
        let sharer = SocialSharer()
        sharer.shareEverywhere(message: "Hello to yall")
        
        sharer.share(message: "hmm", serviceType: .facebook, completionHandler: { (error) in
            if error != nil {
                print("Error sending message")
            }
        })
    }
    
    func getOperationsFromDb() {
        let operations = OperationsManager.shared.getOperationsHistory()
        print(operations)
    }
}
