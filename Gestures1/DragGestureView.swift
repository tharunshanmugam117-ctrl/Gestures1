//
//  DragGestureView.swift
//  Gestures1
//
//  Created by T Krobot on 4/7/26.
//

import SwiftUI

enum Route: Hashable {
    case longPress
    case simultaneous
}

struct DragGestureView: View {
    @State private var isDragging = false
    @State private var offset: CGPoint = CGPoint(x: 156, y: 355)
    @State private var path = NavigationPath()
    
    var isInTargetZone: Bool {
        offset.x > 276 && offset.y > 149 && offset.y < 367
    }
    
    
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
        NavigationStack(path: $path) {
            VStack {
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
                
                if isInTargetZone {
                    Text("You made it!")
                        .bold()
                        .font(.largeTitle)
                        .padding()
                    Button("Buy the drink!!") {
                        path.append(Route.longPress)
                    }
                    .padding()
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
                }
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .longPress: LongpressView(path: $path)
                case .simultaneous: SimultaneousGestureView()
                }
            }
        }
    }
}
#Preview {
    DragGestureView()
}
