//
//  ContentView.swift
//  Gestures1
//
//  Created by T Krobot on 4/7/26.
//

import SwiftUI

struct ContentView: View {
    @State var tapped = false
    var tap: some Gesture {
        TapGesture(count: 1)
            .onEnded { _ in self.tapped = !self.tapped }
    }
    
    var body: some View {
//        NavigationStack {
//            VStack {
//                NavigationLink {
//                    SimultaneousGestureView()
//                } label: {
//                    Text("Go to simultaneous gesture view")
//                }
//            }
//            .navigationTitle("Tap Gesture")
            
            
            Circle()
                .fill(self.tapped ? Color.blue : Color.red)
                .frame(width: 100, height: 100, alignment: .center)
                .gesture(tap)
        }
    }


#Preview {
    ContentView()
//    DragGestureView()
//    LongpressView()
}


