//
//  Stopwatch_swiftuiApp.swift
//  Stopwatch swiftui
//
//  Created by hosam on 3/11/21.
//

import SwiftUI

@main
struct Stopwatch_swiftuiApp: App {
    @StateObject var ss = MainViewModel()
    @StateObject var sss = TimerViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ss)
                .environmentObject(sss)
                .environment(\.layoutDirection, ss.ss ?  .rightToLeft : .leftToRight)
                .environment(\.locale, Locale(identifier:ss.ss ? "ar" : "en"))
        }
    }
}
