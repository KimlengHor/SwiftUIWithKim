//
//  MagnificationGesture.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 7/9/23.
//

import SwiftUI

struct PostView: View {
    
    @State var currentAmount: CGFloat = 0
    let imageUrlString = "https://images.unsplash.com/photo-1593085512500-5d55148d6f0d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80"
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                AsyncImage(url: URL(string: imageUrlString), content: { content in
                    content.image?.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 35, maxHeight: 35)
                        .cornerRadius(17)
                    
                })
                
                Text("Kimleng Hor")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            
            AsyncImage(url: URL(string: imageUrlString), content: { content in
                content.image?.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxHeight: 300)
                    .clipped()
                    .scaleEffect(1 + currentAmount)
                    .gesture(
                        MagnificationGesture()
                            .onChanged({ value in
                                currentAmount = value - 1
                            })
                            .onEnded({ value in
                                withAnimation(.spring()) {
                                    currentAmount = 0
                                }
                            })
                    )
                
            })
            .zIndex(1)
            
            HStack {
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
            .padding(.horizontal)
            .font(.headline)
            
            Text("Banana-vibes only! Keep calm and minion on!")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        }
    }
}

struct MagnificationGesture_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
