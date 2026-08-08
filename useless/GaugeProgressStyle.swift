//
//  GaugeProgressStyle.swift
//  Gestures1
//
//  Created by T Krobot on 25/7/26.
//NOT BEING USED
//NOT BEING USED
//NOT BEING USED
//NOT BEING USED
//NOT BEING USED
//NOT BEING USED

import SwiftUI
internal import Combine

// how d
struct GaugeProgressStyle: ProgressViewStyle {
    var strokeColor = Color.blue
    var strokeWidth = 25.0
    
    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0
        
        return ZStack {
            Rectangle()
                .trim(from: 0, to: fractionCompleted)
                .stroke(strokeColor, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round))
                .rotationEffect(.degrees(0))
        }
    }
}

// A view letting you adjust the progress with tap gestures
struct ProgressView1: View {
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var progress = 0.0
    @State private var pressed = false
    
    var body: some View {
        
        ProgressView(value: progress, total: 1.0)
            .progressViewStyle(GaugeProgressStyle())
            .frame(width: 200, height: 200)
            .contentShape(Rectangle())
        
            .onLongPressGesture(minimumDuration: 0.1) {
                
                
                if pressed {
                    timer.upstream.connect().cancel()
                } else{
                    self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                }
                pressed.toggle()
                
                
                
                //                if progress < 1.0 {
                //
                //                } else{
                //                        withAnimation{
                //                            progress -= 1
            }
        
            .onReceive(timer){time in
                if pressed{
                    timer.upstream.connect().cancel()
                    //                }
                    withAnimation {
                        progress += 0.1
                    }
                }
//                    .onAppear(){
//                        timer.upstream.connect().cancel()
                    }
            }
    }
    
    //    .onLongPressGesture(minimumDuration: 0.5) { pressed.toggle()

    #Preview {
        ProgressView1()
    }
    
