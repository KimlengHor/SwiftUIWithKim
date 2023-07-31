//
//  NeubrutalismViewModifier.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 7/31/23.
//

import Foundation
import SwiftUI

struct NeubrutalismViewModifier: ViewModifier {
    
    let maxWidth: CGFloat?
    let width: CGFloat?
    let height: CGFloat
    let backgroundColor: Color
    let offsetVal: CGFloat
    
    func body(content: Content) -> some View {
        ZStack {
            VStack {}
                .frame(maxWidth: maxWidth)
                .frame(width: width, height: height)
                .background(Color.black)
                .cornerRadius(2)
                .offset(x: offsetVal, y: offsetVal)
            
            content
                .foregroundColor(.black)
                .frame(maxWidth: maxWidth)
                .frame(width: width, height: height)
                .background(backgroundColor)
                .border(.black, width: 2)
                .cornerRadius(2)
        }
    }
}

extension View {
    func withNeubrutalismDesign(maxWidth: CGFloat? = nil, width: CGFloat? = nil, height: CGFloat, backgroundColor: Color = .white, offsetVal: CGFloat = 4) -> some View {
        modifier(NeubrutalismViewModifier(maxWidth: maxWidth, width: width, height: height, backgroundColor: backgroundColor, offsetVal: offsetVal))
    }
}
