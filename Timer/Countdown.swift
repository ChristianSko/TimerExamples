//
//  Countdown.swift
//  Timer
//
//  Created by Skorobogatow, Christian on 19/7/22.
//

import SwiftUI

struct Countdown: View {
    
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
        
    @State var count: Int = 10
    @State var finishedText: String? = nil
    
    @State var currentDate: Date = Date()
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.purple, .blue]), center: .center, startRadius: 5, endRadius: 500)
                .ignoresSafeArea()
            
            Text(finishedText ?? "\(count)")
                .font(.system(size: 100,
                              weight: .semibold,
                              design: .rounded))
                .foregroundColor(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
                .padding()
        }
        .onReceive(timer, perform: { value in
            if count < 1 {
                finishedText = "Wow!"
            } else {
                count -= 1
            }
        })
    }
}

struct Countdown_Previews: PreviewProvider {
    static var previews: some View {
        Countdown()
    }
}
