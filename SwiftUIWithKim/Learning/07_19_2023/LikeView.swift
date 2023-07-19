//
//  LikeView.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 7/19/23.
//

import SwiftUI

struct LikeView: View {
    
    @State var animateLike: Bool = false
    @State var isLiked = false
    
    let imageUrlString = "https://images.unsplash.com/photo-1591946614720-90a587da4a36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80"
    
    var body: some View {
        ZStack {
            VStack {
                AsyncImage(url: URL(string: imageUrlString), content: { content in
                    content.image?
                        .resizable()
                        .scaledToFit()
                })
                
                Button {
                    isLiked = !isLiked
                    
                    if isLiked {
                        animateLike = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                            animateLike = false
                        }
                    }
                } label: {
                    HStack {
                        Image(systemName: isLiked ? "heart.fill" : "heart")
                        Text(isLiked ? "Liked" : "Like")
                    }
                }
                .font(.title)
                .bold()
                .foregroundColor(.black)
            }
        
            LikeAnimationView(animate: $animateLike)
        }
    }
}

struct LikeView_Previews: PreviewProvider {
    static var previews: some View {
        LikeView()
    }
}
