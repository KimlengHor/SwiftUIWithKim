//
//  GradientButtons.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 7/21/23.
//

import SwiftUI

struct GradientButtons: View {
    
    var brandGradient = Gradient(colors: [Color(.systemTeal), Color(.systemPurple), Color(.systemOrange), Color(.systemTeal)])
    
    var body: some View {
        VStack(spacing: 60) {
            Text("Linear Gradient")
                .bold()
                .frame(width: 280, height: 50)
                .foregroundColor(.white)
                .background(LinearGradient(gradient: brandGradient, startPoint: .leading, endPoint: .trailing))
                .clipShape(Capsule())
            
            Text("Linear Gradient")
                .bold()
                .frame(width: 280, height: 50)
                .foregroundColor(.white)
                .overlay {
                    Capsule().stroke(LinearGradient(gradient: brandGradient,
                                                    startPoint: .leading,
                                                    endPoint: .trailing),
                                     lineWidth: 5)
                }
            
            Text("Radial Gradient")
                .bold()
                .frame(width: 160, height: 160)
                .foregroundColor(.white)
                .background(RadialGradient(gradient: brandGradient, center: .center, startRadius: 5, endRadius: 120))
                .clipShape(Circle())
            
            Text("Angular Gradient")
                .bold()
                .frame(width: 160, height: 160)
                .foregroundColor(.white)
                .background(AngularGradient(gradient: brandGradient, center: .center))
                .clipShape(Circle())
        }
    }
}

struct GradientButtons_Previews: PreviewProvider {
    static var previews: some View {
        GradientButtons()
    }
}
