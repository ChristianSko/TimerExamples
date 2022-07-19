//
//  TimerAnimation.swift
//  Timer
//
//  Created by Skorobogatow, Christian on 19/7/22.
//

import SwiftUI

struct TimerAnimation: View {
    
    
    //Animation Counter
    @State var count: Int = 0
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.purple, .blue]), center: .center, startRadius: 5, endRadius: 500)
                .ignoresSafeArea()
            
            HStack(spacing: 15){
                Circle()
                    .offset(y: count == 1 ? -20 : 0)
                Circle()
                    .offset(y: count == 2 ? -20 : 0)
                Circle()
                    .offset(y: count == 3 ? -20 : 0)
            }
            .frame(width: 150)
            .foregroundColor(.white)
        }
        .onReceive(timer, perform: { value in
            withAnimation(.easeInOut(duration: 0.5)) {
                count = count == 3 ? 0 : count + 1
            }
        })
    }
}

struct TimerAnimation_Previews: PreviewProvider {
    static var previews: some View {
        TimerAnimation()
    }
}
