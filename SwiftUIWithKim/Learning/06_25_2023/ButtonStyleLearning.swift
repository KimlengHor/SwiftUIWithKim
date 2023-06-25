//
//  ButtonStyle.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 6/24/23.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    
    let scaledAmount: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
//            .brightness(configuration.isPressed ? 0.05: 0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
    }
}

extension View {
    func withPressableStyle(scaledAmount: CGFloat = 0.9) -> some View {
        buttonStyle(PressableButtonStyle(scaledAmount: scaledAmount))
    }
}

struct ButtonStyleLearning: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Click me")
                .font(.headline)
                .withDefaultButtonFormatting()
        }
        .withPressableStyle()
        .padding(40)
    }
}

struct ButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleLearning()
    }
}
