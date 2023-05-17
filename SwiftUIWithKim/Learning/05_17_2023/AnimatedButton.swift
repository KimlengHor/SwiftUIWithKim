//
//  AnimatedButton.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 5/17/23.
//

import SwiftUI

struct AnimatedButton: View {
    
    @State private var animated = false
    private let secondaryAccentColor = Color.orange
    private let accentColor = Color.yellow
    
    /**
    Applies dynamic shadow, scaling, and offset effects to the view based on the animated boolean variable.
    - The background color of the view is based on the animated boolean variable.
    - When animated is true, the background color is set to secondaryAccentColor.
    - When animated is false, the background color is set to accentColor.
    - The color parameter of the shadow is determined by the animated state:
    - When animated is true, the secondaryAccentColor with an opacity of 0.7 is used.
    - When animated is false, the accentColor with an opacity of 0.7 is used.
    - The radius of the shadow is determined by the animated state:
    - When animated is true, a radius of 30 is used.
    - When animated is false, a radius of 10 is used.
    - The shadow is positioned with an x offset of 0.
    - The y offset of the shadow is determined by the animated state:
    - When animated is true, a y offset of 50 is used.
    - When animated is false, a y offset of 10 is used.
    - The view is scaled based on the animated state:
    - When animated is true, a scale factor of 1.1 is applied.
    - When animated is false, no scaling is applied.
    - The view is vertically offset based on the animated state:
    - When animated is true, a vertical offset of -7 is applied.
    - When animated is false, no vertical offset is applied.
    - The addAnimation function is called when the view appears, initiating the animation.
    */
    var body: some View {
            Button {
                print("Clicked")
            } label: {
                Text("Click me")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(animated ? secondaryAccentColor : accentColor)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 50)
            .shadow(
                color: animated ? secondaryAccentColor.opacity(0.7) : accentColor.opacity(0.7),
                radius: animated ? 30 : 10,
                x: 0,
                y: animated ? 50 : 10)
            .scaleEffect(animated ? 1.1 : 1.0)
            .offset(y: animated ? -7 : 0)
            .onAppear(perform: addAnimation)
    }
    
    ///
    ///```
    ///Adds an animation to the view by scheduling a closure to be executed on the main dispatch queue.
    ///The animation is applied using the withAnimation function, which wraps the closure with an animation context.
    ///Within the animation context, the animated boolean variable is toggled, triggering the animatable change.
    ///The animation has an ease-out timing curve with a duration of 1.0 second and repeats indefinitely.
    ///This function is useful for creating a recurring animation effect on a view.
    ///```
    private func addAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(
                Animation
                    .easeOut(duration: 1.0)
                    .repeatForever()
            ) {
                animated.toggle()
            }
        }
    }
}

struct AnimatedButton_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedButton()
    }
}
