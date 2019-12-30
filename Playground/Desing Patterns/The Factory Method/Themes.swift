//
//  Themes.swift
//  Playground
//
//  Created by Onur Keskin on 30.12.2019.
//  Copyright © 2019 Onur Keskin. All rights reserved.
//

import Foundation
import UIKit

protocol Theme {
    var backgroundColor: UIColor {get}
    var textColor: UIColor {get}
}

struct PurpleTheme: Theme {
    let backgroundColor = UIColor.purple
    let textColor = UIColor.white
    init() { }
}

struct DarkTheme: Theme {
    let backgroundColor = UIColor.black
    let textColor = UIColor.orange
    init() { }
}

struct BlueTheme: Theme {
    let backgroundColor = UIColor.blue
    let textColor = UIColor.red
    init() { }
}
