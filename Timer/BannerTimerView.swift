//
//  ContentView.swift
//  Timer
//
//  Created by Skorobogatow, Christian on 19/7/22.
//

import SwiftUI

struct BannerTimerView: View {
    
    let timer = Timer.publish(every: 2.0, on: .main, in: .common).autoconnect()
    
    @State var count: Int = 1
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.purple, .blue]), center: .center, startRadius: 5, endRadius: 500)
                .ignoresSafeArea()
            
            TabView(selection: $count,
                    content: {
                Rectangle()
                    .foregroundColor(.red)
                    .tag(1)
                Rectangle()
                    .foregroundColor(.blue)
                    .tag(2)
                Rectangle()
                    .foregroundColor(.green)
                    .tag(3)
                Rectangle()
                    .foregroundColor(.orange)
                    .tag(4)
                Rectangle()
                    .foregroundColor(.pink)
                    .tag(5)
            })
            .frame(height: 200)
            .tabViewStyle(PageTabViewStyle())
        }
        .onReceive(timer, perform: { value in
            withAnimation(.default) {
                count = count == 5 ? 1 : count + 1
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BannerTimerView()
    }
}
