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
    @State private var isDragging = false
    @State private var offset: CGPoint = CGPoint(x: 200, y: 500)
    @State private var startLocation: CGPoint?
    @State private var sheetPresented = false
    var isInTargetZone: Bool {
        offset.x > 100 && offset.y > 100 && offset.y < 300 && offset.x < 500
    }
    
    //      @State private var isDragging = false
    var drag: some Gesture {
        DragGesture()
        
            .onChanged { value in
                isDragging = true
                if startLocation == nil{
                    startLocation = offset}
                offset = CGPoint(
                    x: startLocation!.x + value.translation.width,
                    y: startLocation!.y + value.translation.height
                )
            }
            .onEnded { _ in
                isDragging = false
                //startLocation = nil
                // reset for next drag
            }
    }
    
    
    var body: some View {
        ZStack{
            Image("pond")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Text("Ducks belong in the pond!!!")
                    .bold()
                    .font(.system(size:30))
                    .foregroundStyle(.white)
                    .offset(y:40)
                    
                Group {
                    if isDragging == false {
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
            }
            .sheet(isPresented: $sheetPresented) {
                Text("You tapped 50 times!")
                    .font(.title3)
                    .padding()
                
                
                
            }
            if isInTargetZone {
                
                LemonOutline()
                    .offset(y:-120)
                }

            }
        }
    }



#Preview {
    SimultaneousGestureView()
}
