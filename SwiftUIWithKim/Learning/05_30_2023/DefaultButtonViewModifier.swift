//
//  DefaultButtonViewModifier.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 5/30/23.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
    }
}

extension View {
    func withDefaultButtonFormatting(backgroundColor: Color = .blue) -> some View {
        modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
}

struct ViewModifierBootcamp: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Hello, world")
                .font(.headline)
                .withDefaultButtonFormatting(backgroundColor: .blue)
            
            Text("Hello, everyone")
                .font(.subheadline)
                .withDefaultButtonFormatting(backgroundColor: .orange)

            Text("Hello, team")
                .font(.title)
                .withDefaultButtonFormatting(backgroundColor: .pink)
        }
        .padding()
    }
}

struct ViewModifierBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierBootcamp()
    }
}

