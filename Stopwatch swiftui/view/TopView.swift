//
//  TopView.swift
//  Stopwatch swiftui
//
//  Created by hosam on 3/11/21.
//

import SwiftUI

struct TopView: View {
    @EnvironmentObject var vm : MainViewModel
    
    var body: some View {
        HStack {
            Spacer()
            
            HStack(spacing:0){
                Text("Clear ")
                    .foregroundColor(Color.red)
                    .font(.system(size: 26, weight: .bold))
                Text("Stopwatch ")
                    .foregroundColor(Color.orange)
                    .font(.system(size: 26, weight: .bold))
                
            }
            
            Spacer()
            
            Button(action: {
                withAnimation{
//                    self.vm.ss.toggle()
                }
            }, label: {
                Text("About")
                    .foregroundColor(Color.blue)
                    .font(.system(size: 20, weight: .bold))
            })
//            Text("About")
//                .foregroundColor(Color.blue)
//                .font(.system(size: 20, weight: .bold))
            
        }
        .padding(.horizontal)
        .background(Color("Color"))
    }
    
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
