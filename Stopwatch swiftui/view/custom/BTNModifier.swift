//
//  BTNModifier.swift
//  Stopwatch swiftui
//
//  Created by hosam on 3/11/21.
//

import SwiftUI

struct BTNModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 100, height: 100)
            .padding(.vertical,10)
            .background(Color.white)
            
//            .clipShape(
//                Circle()
//            )
            .overlay(
                Circle()
                        .stroke(Color.blue, lineWidth: 4)
                )
            
    }
}
