//
//  DragGestureView.swift
//  Gestures1
//
//  Created by T Krobot on 4/7/26.
//

import SwiftUI

struct DragGestureView: View {
    @State private var isDragging = false
    @State private var offset: CGPoint = CGPoint(x: 300, y: 100)
    
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { _ in self.isDragging = true }
            .onChanged { value in
                offset = value.location
                print(offset)
            }
            .onEnded { _ in self.isDragging = false }
    }
    
    
    var body: some View {
        HStack{
            Text("DRAG THE DUCK TO THE LEMONADE STAND")
                .font(.largeTitle)
        }
        ZStack{
            Image(.lemonadeStand2)
                

            Image(.duck3)
                .scaledToFit()
                .scaledToFill()
                .font(.system(size:-100))
                .position(offset)
                .gesture(drag)
            
            
        }
    }
}

#Preview {
    DragGestureView()
}
