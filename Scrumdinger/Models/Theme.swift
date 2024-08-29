//
//  Theme.swift
//  Scrumdinger
//
//  Created by Eliude Vemba on 24/05/24.
//

import SwiftUI

enum Theme: String, CaseIterable, Identifiable, Codable {
    case bubblegum
    case buttercup
    case myIndigo
    case lavender
    case myMagenta
    case navy
    case myOrange
    case oxblood
    case periwinkle
    case poppy
    case myPurple
    case seafoam
    case sky
    case tan
    case myTeal
    case myYellow
    
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .myOrange, .periwinkle, .poppy, .seafoam, .sky, .tan, .myTeal, .myYellow: return .black
        case .myIndigo, .myMagenta, .navy, .oxblood, .myPurple: return .white
        }
    }
    
    var mainColor: Color {
        Color(rawValue)
    }
    
    var name: String {
        rawValue.capitalized
    }
    
    var id: String {
        name
    }
}
