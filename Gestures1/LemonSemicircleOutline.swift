//
//  LemonSemicircleOutline.swift
//  Gestures1
//
//  Created by T Krobot on 29/8/26.
//


import SwiftUI

struct LemonOutline: View {
    let count = 10      // more = denser outline
    let radius: CGFloat = 200
    
    var body: some View {
        ZStack {
            Color.clear.frame(width: 320, height: 170)
            
            // Optional: faint guide arc
            Arc(startAngle: .degrees(30), endAngle: .degrees(0))
                .stroke(Color.yellow.opacity(0), lineWidth: 2)
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
                    .font(.system(size: 50))
                    .offset(x: x, y: y + radius / 2)
            }
        }
    }
}

struct semi: Shape {
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
    LemonOutline()
}
