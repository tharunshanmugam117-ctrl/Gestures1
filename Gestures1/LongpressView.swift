//
//  LongpressView.swift
//  Gestures1
//
//  Created by T Krobot on 1/8/26.
//

import SwiftUI

// Source - https://stackoverflow.com/a/77639424
// Posted by Sweeper
// Retrieved 2026-08-01, License - CC BY-SA 4.0

struct LongpressView: View {
    @State private var touchDown = false
    @State private var isPopupPresented = false
    
    var body: some View {
        
        Text("Hold for lemonade!")
            .font(.system(size: 20, weight: .heavy, design: .rounded))
            .foregroundColor(.white)
            .frame(width: 300, height: 40, alignment: .center)
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(Color.secondary)
                    .overlay(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Color.blue)
                        // I prefer the effect of using an offset instead of width
                            .offset(x: touchDown ? 0 : -300)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            )
            .simultaneousGesture(
                DragGesture(minimumDistance: 0).onChanged({ value in
                    if !touchDown {
                        withAnimation(.linear(duration: 2)) {
                            touchDown = true
                        }
                    }
                }).onEnded({ _ in
                    if !isPopupPresented {
                        touchDown = false
                    }
                })
            )
            .simultaneousGesture(
                LongPressGesture(minimumDuration: 2, maximumDistance: .infinity)
                    .onEnded({ _ in
                        isPopupPresented = true
                    })
            )
            .sheet(isPresented: $isPopupPresented) {
                Text("You bought Lemonade!")
                HStack{
                    Image(.duck2)
                    Image(.lemonade)
                }
            }
    }
}
#Preview {
    LongpressView()
}
