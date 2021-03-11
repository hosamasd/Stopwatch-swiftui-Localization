//
//  SwipeButtonView.swift
//  mail swapping
//
//  Created by hosam on 3/10/21.
//

import SwiftUI

//swipe view
struct SwipeButtonView: View {
    @ObservedObject var manager: TimerViewModel
    let mail: StopwatchModel
    
    var body: some View {
        ZStack {
            HStack {
                Button(action: {
                    manager.deleteMail(mail: mail)
//                    manager.markRead(mail: mail)
                }, label: {
                    // wave shave view
                    DeleteButtonView(mail: mail,xx: true)
                })
                
                Spacer()
            }
            
            HStack {
                Spacer()
                Button(action: {
                    withAnimation(.linear) {
                        manager.deleteMail(mail: mail)
                    }
                }, label: {
                    // wave shave view
                    DeleteButtonView(mail: mail)
                })
            }
        }
    }
}
