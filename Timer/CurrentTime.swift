//
//  CurrentTime.swift
//  Timer
//
//  Created by Skorobogatow, Christian on 19/7/22.
//

import SwiftUI

struct CurrentTime: View {
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
//        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }
    
    @State var currentDate: Date = Date()
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.purple, .blue]), center: .center, startRadius: 5, endRadius: 500)
                .ignoresSafeArea()
            
            Text(dateFormatter.string(from: currentDate))
                .font(.system(size: 100,
                              weight: .semibold,
                              design: .rounded))
                .foregroundColor(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
                .padding()
        }
        .onReceive(timer, perform: { value in
            currentDate = value
        })
    }
}

struct CurrentTime_Previews: PreviewProvider {
    static var previews: some View {
        CurrentTime()
    }
}
