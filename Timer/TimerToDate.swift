//
//  TimerToDate.swift
//  Timer
//
//  Created by Skorobogatow, Christian on 19/7/22.
//

import SwiftUI

struct TimerToDate: View {
    
    //Countdown to date
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    @State var timeRemaining: String = ""
    let futureDate: Date = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
    
    @State var currentDate: Date = Date()
    
    
    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.minute, .second], from: Date(), to: futureDate)
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        timeRemaining = "\(minute) minutes, \(second) seconds"
        
    }
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.purple, .blue]), center: .center, startRadius: 5, endRadius: 500)
                .ignoresSafeArea()
            
            Text(timeRemaining)
                .font(.system(size: 100,
                              weight: .semibold,
                              design: .rounded))
                .foregroundColor(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
                .padding()
        }
        .onReceive(timer, perform: { value in
            updateTimeRemaining()
        })
    }
}

struct TimerToDate_Previews: PreviewProvider {
    static var previews: some View {
        TimerToDate()
    }
}
