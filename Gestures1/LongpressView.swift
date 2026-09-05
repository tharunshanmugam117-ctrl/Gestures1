//
//  LongpressView.swift
//  Gestures1
//
//  Created by T Krobot on 1/8/26.
//

import SwiftUI

// Source - https://stackoverflow.com/a/77639424

struct LongpressView: View {
    @Binding var path: NavigationPath
    @State private var touchDown = false
    @State private var isPopupPresented = false
    
    var body: some View {
        VStack{
            Text("Your lemonade is almost done!")
                .bold()
                .font(.largeTitle)
//            Text("Fill the bar to get your lemonade")
//                .bold()
//                .font(.largeTitle)
            
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
                    VStack{
                        Text("You bought Lemonade!")
                        HStack{
                            Image(.duck2)
                            Image(.lemonade)
                        }
                        Button("YAYYAYYAY Let's Go") {
                            isPopupPresented = false
                            path.append(Route.simultaneous)
                        }
                        .padding()
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(.capsule)
                        
                    }
                }
        }
    }
}
#Preview {
    LongpressView(path: .constant(NavigationPath()))
}
