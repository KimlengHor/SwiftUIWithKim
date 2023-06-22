//
//  LoadingView.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 6/20/23.
//

import SwiftUI

struct LoadingView: View {
    
    @State private var loadingText: [String] = "Loading...".map { String($0) }
    @State private var counter: Int = 0
    
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
//        VStack(spacing: 15) {
//            Image(systemName: "circle.hexagongrid")
//                .resizable()
//                .frame(width: 50, height: 50)

                HStack(spacing: 0) {
                    ForEach(loadingText.indices) { index in
                        Text(loadingText[index])
                            .font(.headline)
                            .fontWeight(.heavy)
                            .offset(y: counter == index ? -5 : 0)
                    }
                }
//        }
        .onReceive(timer) { _ in
            withAnimation(.spring()) {
                let lastIndex = loadingText.count - 1
                if counter == lastIndex {
                    counter = 0
                } else {
                    counter += 1
                }
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
