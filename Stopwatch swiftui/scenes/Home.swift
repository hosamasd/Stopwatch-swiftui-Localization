//
//  Home.swift
//  Stopwatch swiftui
//
//  Created by hosam on 3/11/21.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var timerVM : TimerViewModel
    @State var show=false
    var body: some View {
        
        ZStack {
            
            
            VStack {
                
                TopView( show: $show)
                
                Spacer()
                    .frame(height:120)
                //                .padding(.bottom,5)
                
                StopWatchView()
                ZStack{
                    
                Color.darkPurple
                    
                    
                ScrollView(.vertical, showsIndicators: true) {
                    ForEach(timerVM.stopwatchArray) { mail in
                        
                        ZStack {
                            
                            SwipeButtonView(manager: timerVM, mail: mail)
                            
                            LabView(lab: mail, manager: timerVM)
                                .gesture(
                                    DragGesture(minimumDistance: 10)
                                        
                                        .onChanged({ value in
                                            
                                            // handle swipe
                                            if value.translation.width > 0 {
                                                timerVM.handleReadGesture(mail: mail, swipeWidth: value.translation.width)
                                                //lets take it one step further by swipping left to delete the mail
                                            } else if value.translation.width < 0 {
                                                // handle delete gesture
                                                timerVM.handleDeleteGesture(mail: mail, swipeWidth: value.translation.width)
                                            }
                                            // handle swipe
                                            
                                            //                                    timerVM.handleDeleteGesture(mail: mail, swipeWidth: value.translation.width)
                                            
                                        })
                                        .onEnded({ _ in
                                            timerVM.swipeEnded()
                                        })
                                )
                            
                        }
                        
                        
                    }
                    .padding(.horizontal)
                    .padding(.vertical)
                    
                }
                    
                }
                .ignoresSafeArea()
                
                //            Spacer()
                
            }
            
            
            if show {
                DetailView( show: $show)
                    .transition(.move(edge: .bottom))
            }
            
        }
        .background(Color.white)
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
