//
//  RectangleProgressBar.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 9/18/23.
//

import SwiftUI

struct RectangleProgressBar: View {
    @State var progress = CGFloat.zero

    var body: some View {
        ZStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 6)
                
                RoundedRectangle(cornerRadius: 20)
                    .trim(from: 0.0, to: CGFloat(progress))
                    .stroke(LinearGradient(colors: [.orange, .red, .blue], startPoint: .leading, endPoint: .trailing), lineWidth: 6)
                    .onAppear {
                        let baseAnimation = Animation.easeInOut(duration: 10)
                        let repeated = baseAnimation.repeatForever(autoreverses: true)
                        
                        withAnimation(repeated) {
                            progress = 1
                        }
                    }
            }
            
            Text("SwiftUI with KIM")
                .bold()
        }
        .padding(30)
    }
}

struct RectangleProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        RectangleProgressBar()
    }
}
