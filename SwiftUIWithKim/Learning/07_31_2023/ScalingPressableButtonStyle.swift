//
//  ScalingPressableButtonStyle.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 7/31/23.
//

import SwiftUI

struct ScalingPressableButtonStyle: ButtonStyle {
    
    let scaledAmount: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
    }
}

extension View {
    func withScalingPressableStyle(scaledAmount: CGFloat = 0.9) -> some View {
        buttonStyle(ScalingPressableButtonStyle(scaledAmount: scaledAmount))
    }
}
