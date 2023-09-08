//
//  ExplodingView.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 9/8/23.
//

import SwiftUI

struct ExplodingView: View {
    
    @State var isExploded: Bool = false
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(0..<75) { _ in
                    Rectangle()
                        .rotation(Angle(degrees: Double.random(in: 0..<360)))
                        .frame(width: 20, height: 20)
                        .foregroundColor([.orange, .red, .yellow].randomElement())
                        .offset(x: isExploded ? (Double.random(in: -1...1) * 500) : 0, y: isExploded ? (Double.random(in: -1...1) * 500) : 0)
                        .opacity(isExploded ? 0 : 1)
                        .animation(.easeInOut.speed(0.6), value: isExploded)
                        .padding()
                }
            }
            Button {
                isExploded.toggle()
            } label: {
                Text("Click")
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct ExplodingView_Previews: PreviewProvider {
    static var previews: some View {
        ExplodingView()
    }
}
