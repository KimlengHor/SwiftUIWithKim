//
//  TinderSwipe.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 8/21/23.
//

import SwiftUI

struct TinderSwipe: View {
    @State private var offset = CGSize.zero
    
    var body: some View {
        textSection
        .offset(x: offset.width, y: offset.height * 0.4)
        .rotationEffect(.degrees(Double(offset.width / 40)))
        .gesture(
            DragGesture()
                .onChanged({ gesture in
                    offset = gesture.translation
                }) .onEnded({ _ in
                    withAnimation {
                        swipeCard(width: offset.width)
                    }
                })
        )
        .padding(.horizontal, 24)
    }
    
    func swipeCard(width: CGFloat) {
        switch width {
        case -500...(-150):
            offset = CGSize(width: -500, height: 0)
        case 150...500:
            offset = CGSize(width: 500, height: 0)
        default:
            offset = .zero
        }
    }
}

extension TinderSwipe {
    private var textSection: some View {
        VStack(spacing: 24) {
            Text("😂")
                .font(.custom("sans-serif", size: 100))
            Text("Send a funny meme to the last person you texted without any context")
                .foregroundColor(.primary)
            Text("or drink 2")
                .foregroundColor(Color.red)
        }
        .offset(y: -20)
        .multilineTextAlignment(.center)
        .padding(24)
        .font(.custom("sans-serif", size: 24))
        .frame(maxWidth: .infinity, maxHeight: 500)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(.primary, lineWidth: 5)
        )
    }
}

struct TinderSwipe_Previews: PreviewProvider {
    static var previews: some View {
        TinderSwipe()
    }
}
