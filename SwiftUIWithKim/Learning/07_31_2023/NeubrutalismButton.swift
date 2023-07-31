//
//  NeubrutalismButton.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 7/31/23.
//

import SwiftUI

struct NeubrutalismButton: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Neubrutalism Button")
                .font(.headline)
                .fontWeight(.medium)
                .withNeubrutalismDesign(maxWidth: .infinity, height: 48, backgroundColor: Color(cgColor: CGColor(red: 1, green: 0.961, blue: 0, alpha: 1)))
        }
        .withScalingPressableStyle()
    }
}

struct NeubrutalismButton_Previews: PreviewProvider {
    static var previews: some View {
        NeubrutalismButton()
            .padding(24)
    }
}
