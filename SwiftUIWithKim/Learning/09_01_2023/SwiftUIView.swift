//
//  SwiftUIView.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 9/1/23.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1964&q=80"), content: { content in
            content.image?
                .resizable()
                .scaledToFill()
                .frame(width: nil, height: 100)
                .mask(
                    Text("SwiftUI")
                        .font(.system(size: 72))
                )
        })
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
