//
//  ColorfulSpinnerView.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 8/9/23.
//

import SwiftUI

struct ColorfulSpinnerView: View {
    
    @State private var isRotating = 0.0
    
    var brandGradient = Gradient(colors: [Color(.systemTeal), Color(.systemPurple), Color(.systemOrange), Color(.systemTeal)])
    
    var body: some View {
        VStack {}
            .frame(width: 50, height: 50)
            .foregroundColor(.white)
            .background(AngularGradient(gradient: brandGradient, center: .center))
            .clipShape(Circle())
            .rotationEffect(.degrees(isRotating))
            .onAppear {
                withAnimation(.linear(duration: 0.5)
                        .repeatForever(autoreverses: false)) {
                    isRotating = 360.0
                }
            }
    }
}

struct ColorfulSpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorfulSpinnerView()
    }
}
