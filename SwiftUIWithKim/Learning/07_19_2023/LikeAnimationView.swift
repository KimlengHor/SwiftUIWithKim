//
//  LikeAnimationView.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 7/19/23.
//

import SwiftUI

struct LikeAnimationView: View {
    
    @Binding var animate: Bool
    
    var body: some View {
        ZStack {
            Image(systemName: "heart.fill")
                .foregroundColor(Color.red.opacity(0.3))
                .font(.system(size: 200))
                .scaleEffect(animate ? 1.0 : 0.3)
            
            Image(systemName: "heart.fill")
                .foregroundColor(Color.red.opacity(0.6))
                .font(.system(size: 150))
                .scaleEffect(animate ? 1.0 : 0.4)
            
            Image(systemName: "heart.fill")
                .foregroundColor(Color.red.opacity(0.9))
                .font(.system(size: 100))
                .scaleEffect(animate ? 1.0 : 0.5)
        }
        .opacity(animate ? 1.0 : 0.0)
        .animation(Animation.easeInOut(duration: 0.5), value: animate)
    }
}

struct LikeAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        LikeAnimationView(animate: .constant(true))
    }
}
