//
//  ThemeCreator.swift
//  Playground
//
//  Created by Onur Keskin on 30.12.2019.
//  Copyright © 2019 Onur Keskin. All rights reserved.
//

import Foundation

//Commented out parts are implementation from the video

//protocol ThemeCreator {
//    static func makeTheme(profile: ColorProfile) -> Theme
//}

enum ColorProfile {
    case purple, dark, blue
}

//extension ThemeCreator {
//    static func makeTheme(profile: ColorProfile) -> Theme {
//        switch profile {
//        case .light:
//            return LightTheme()
//        case .dark:
//            return DarkTheme()
//        case .blue:
//            return BlueTheme()
//        }
//    }
//}

//public class MyThemeCreator: ThemeCreator {}

class ThemeCreator {
    static func makeTheme(profile: ColorProfile) -> Theme {
        switch profile {
        case .purple:
            return PurpleTheme()
        case .dark:
            return DarkTheme()
        case .blue:
            return BlueTheme()
        }
    }
}
