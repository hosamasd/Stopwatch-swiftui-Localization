//
//  LabView.swift
//  Stopwatch swiftui
//
//  Created by hosam on 3/11/21.
//

import SwiftUI

struct LabView: View {
    
    let lab:StopwatchModel
    @ObservedObject var manager: TimerViewModel
    var isChanging = false
    
    var body: some View {
        
        
        ZStack {
            Color.lightPurple
                .cornerRadius(15)
            
            
            VStack {
                
                
                HStack {
                    
                    Text("Lap \(lab.lapCount)")
                        .font(.system(size:20))
                    
                    Spacer()
                    
                    Text(lab.lapText)
                        .font(.system(size:20))
                    
                }
                .padding()
                
                Divider()
            }
        }
        
        .offset(x: lab.offsetX)
        
        
    }
    
    
    
    
}
