//
//  SectionHeaderView.swift
//  Stopwatch swiftui
//
//  Created by hosam on 3/11/21.
//

import SwiftUI

struct SectionHeaderView: View {
    var name:String = "Follow Us"
    
    var body: some View {
        HStack{
            Text(name)
            
            Spacer()
        }
        .padding()
        .background(Color("Color"))
        
    }
}

struct SectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeaderView()
    }
}
