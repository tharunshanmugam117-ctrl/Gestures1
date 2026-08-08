//
//  SimultaneousGestureView.swift
//  Gestures1
//
//  Created by T Krobot on 11/7/26.
//

import SwiftUI

struct SimultaneousGestureView: View {
    @State private var tapped = 0
     @State private var dragged = false
    @State private var offset: CGSize = .zero
//      @State private var isDragging = false
    var drag: some Gesture {
        DragGesture()

            .onChanged { value in
                offset = value.translation
            }
            .onChanged { _ in dragged = true }
            .onEnded { _ in dragged = false }
        
    }

     var body: some View {
       Circle()
         .fill(dragged ? .orange : .purple)
         .frame(height: 120)
         .scaledToFit()
         .overlay(Text("taps: \(tapped)"))
         .simultaneousGesture(TapGesture().onEnded { tapped += 1 })
         .offset(offset)
         .gesture(drag)
     }
   }

#Preview {
    SimultaneousGestureView()
}
