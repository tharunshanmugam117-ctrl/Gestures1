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
import SwiftUI

struct LemonRainbowView: View {
    let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .indigo, .purple]
    // use lemon yellow for the yellow band: Color(red: 1, green: 0.92, blue: 0.2)
    
    @State private var appear = false
    
    var body: some View {
        VStack {
            ZStack {
                // Rainbow arcs
                ForEach(0..<colors.count, id: \.self) { i in
                    Arc(startAngle: .degrees(180), endAngle: .degrees(0))
                        .stroke(colors[i], lineWidth: 14)
                        .frame(width: 280 - CGFloat(i * 28), height: 280 - CGFloat(i * 28))
                }
                
                // Lemons at ends
                HStack(spacing: 220) {
                    Text("🍋").font(.system(size: 50))
                    Text("🍋").font(.system(size: 50))
                }
                .offset()
            }
            .frame(height: 170)
            .scaleEffect(appear ? 1 : 0.6)
            .opacity(appear ? 1 : 0)
            .animation(.spring(response: 0.7, dampingFraction: 0.6), value: appear)
            .onAppear { appear = true }
            
            Button("Show Again") {
                appear = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { appear = true }
            }
        }
    }
}

// Helper shape
struct Arc: Shape {
    var startAngle: Angle
    var endAngle: Angle
    func path(in rect: CGRect) -> Path {
        var p = Path()
        p.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                 radius: rect.width / 2,
                 startAngle: startAngle,
                 endAngle: endAngle,
                 clockwise: false)
        return p
    }
}

#Preview {
    LemonRainbowView()
}
import SwiftUI

struct LemonSemicircleOutline: View {
    let count = 21      // more = denser outline
    let radius: CGFloat = 120
    
    var body: some View {
        ZStack {
            Color.clear.frame(width: 320, height: 170)
            
            // Optional: faint guide arc
            Arc(startAngle: .degrees(180), endAngle: .degrees(0))
                .stroke(Color.yellow.opacity(0.3), lineWidth: 2)
                .frame(width: radius * 2, height: radius * 2)
                .offset(y: radius / 2)

            // Lemon outline
            ForEach(0..<count, id: \.self) { i in
                let progress = Double(i) / Double(count - 1) // 0...1
                let angle = 180 - (progress * 180) // 180° -> 0° (left to right)
                let radians = angle * .pi / 180
                let x = cos(radians) * radius
                let y = -sin(radians) * radius
                
                Text("🍋")
                    .font(.system(size: 22))
                    .offset(x: x, y: y + radius / 2)
            }
        }
    }
}

struct arc: Shape {
    var startAngle: Angle
    var endAngle: Angle
    func path(in rect: CGRect) -> Path {
        var p = Path()
        p.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                 radius: rect.width/2,
                 startAngle: startAngle,
                 endAngle: endAngle,
                 clockwise: false)
        return p
    }
}

#Preview {
    LemonSemicircleOutline()
}
