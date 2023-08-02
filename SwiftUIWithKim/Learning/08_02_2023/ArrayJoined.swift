//
//  ArrayJoined.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 8/2/23.
//

import SwiftUI

struct ArrayJoined: View {
    
    @State private var favoriteTopics = [String]()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Choose your favorite topics")
            HStack {
                Button("Sport") {
                    favoriteTopics.append("Sport")
                }
                .buttonStyle(.borderedProminent)
                
                Button("Business") {
                    favoriteTopics.append("Business")
                }
                .buttonStyle(.borderedProminent)
                
                Button("Technology") {
                    favoriteTopics.append("Technology")
                }
                .buttonStyle(.borderedProminent)
                
                Spacer()
            }
            
            Text("Your topics are: \(favoriteTopics.joined(separator: ", "))")
                .bold()
            
            Spacer()
        }
        .padding()
        .navigationTitle("Topic")
    }
}

struct ArrayJoined_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ArrayJoined()
        }
    }
}
