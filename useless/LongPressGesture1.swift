//
//  LongPressGesture.swift
//  Gestures1
//
//  Created by T Krobot on 11/7/26.
////NOT BEING USED
//NOT BEING USED
//NOT BEING USED
//NOT BEING USED
//NOT BEING USED
//NOT BEING USED

import SwiftUI

struct LongPressGesture1: View {
//    let timer = Timer.publish(every: 1, tolerance: 1
//                              , on: .main, in: .common)
    @State private var counter = 0
    @State private var pressed = false
      var body: some View {
        Text(pressed ? "Pressed" : "Hold me")
          .padding(12)
          .background(.blue.opacity(0.1))
          .cornerRadius(8)
          .onLongPressGesture(minimumDuration: 2.0) { pressed.toggle() }
      }
    }


#Preview {
    LongPressGesture1()
}
