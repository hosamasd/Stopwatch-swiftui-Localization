//
//  StopWatchView.swift
//  Stopwatch swiftui
//
//  Created by hosam on 3/11/21.
//

import SwiftUI

struct StopWatchView: View {
    
    @EnvironmentObject var vm : TimerViewModel
    
    var body: some View {
        VStack(alignment: .trailing) {
            
            Text(vm.smallLabel)
                .font(.system(size: 20))
                .multilineTextAlignment(.trailing)
            
            Text(vm.bigLabel)
                .font(.system(size: 50))
                .multilineTextAlignment(.center)
            
            HStack(spacing:40) {
                
                
                Button(action: {
                    withAnimation{
                        vm.handleLab()
                    }
                }, label: {
                    Text(
                        vm.isReset ? "Lap" : "Reset"
//                        vm.labText
                    
                    )
                        .foregroundColor(vm.labColor)
                        .font(.system(size: 18))
                        
                })
                .modifier(BTNModifier())
                .disabled(!vm.labEnabled)
                
                
                Button(action: {
                    withAnimation{
                        vm.handleStart()
                    }
                }, label: {
                    Text(
                        vm.isStop ? "Stop" : "Start"
//                        vm.startText
                    )
                        .foregroundColor(vm.startColor)
                        .font(.system(size: 18))
                        
                })
                .modifier(BTNModifier())
               
            }
        }
    }
}

struct StopWatchView_Previews: PreviewProvider {
    static var previews: some View {
        StopWatchView()
    }
}
