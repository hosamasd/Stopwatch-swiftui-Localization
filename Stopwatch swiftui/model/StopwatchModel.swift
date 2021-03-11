//
//  StopwatchModel.swift
//  Stopwatch swiftui
//
//  Created by hosam on 3/11/21.
//

import SwiftUI
struct StopwatchModel:Identifiable {
    let id = UUID().uuidString
    
    let counter,lapCount:Int
    let lapText:String
    var offsetX: CGFloat = 0.0

    
}


// first we need colors
extension Color {
    static let darkPurple = Color.init(red: 120/255, green: 106/255, blue: 213/255)
    static let extradarkPurple = Color.init(red: 105/255, green: 91/255, blue: 207/255)
    static let lightPurple = Color.init(red: 139/255, green: 124/255, blue: 225/255)
    static let appGreen = Color.init(red: 45/255, green: 188/255, blue: 179/255)
}
