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
    @State private var offset: CGPoint = CGPoint(x: 200, y: 400)
    @State private var sheetPresented = false
    //      @State private var isDragging = false
    var drag: some Gesture {
        DragGesture()
        
            .onChanged { value in
                offset = value.location
            }
            .onChanged { _ in dragged = true }
        
        //            .onEnded { _ in dragged = false }
            .onEnded{_ in
                withAnimation(.bouncy) {
                    dragged = false
                }
                
            }
        
    }
    
    var body: some View {
        VStack {
            Text("Drag the Duck Around!!!")
                .bold()
                .font(.largeTitle)
            
            Group {
                if dragged {
                    Image(.duck3)
                        .frame(width: 100, height: 100)
                        .scaledToFit()
                } else {
                    Image(.realduck)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 90)
                }
            }
            .simultaneousGesture(TapGesture().onEnded {
                tapped += 1
                if tapped == 50 {
                    sheetPresented = true
                }
            })
            .position(offset)
            .gesture(drag)
            Text("Free 2d fidget toy!!! ClICK TO CHANGE COLOUR")
                .font(.caption)
            ContentView()
        }
        .sheet(isPresented: $sheetPresented) {
            Text("You tapped 50 times!")
                .font(.title3)
                .padding()
        
        }
    }
}

#Preview {
    SimultaneousGestureView()
}
