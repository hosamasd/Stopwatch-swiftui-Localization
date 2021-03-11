//
//  DeleteButtonView.swift
//  mail swapping
//
//  Created by hosam on 3/10/21.
//

import SwiftUI

struct DeleteButtonView: View {
    let mail: StopwatchModel
    var xx:Bool = false
    
    var body: some View {
        ZStack {
            WaveShape(waveWidth: mail.offsetX, isLeft: xx)
                .fill(Color.red)
                .frame(width: 60)
            Image(systemName: "xmark")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
                .opacity(check() ? 1.0 : 0.0)
        }
    }
    
    func check() -> Bool {
        mail.offsetX < -50 || mail.offsetX > 50
    }
}
