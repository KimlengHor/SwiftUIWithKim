//
//  InifiniteScrollView.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 7/17/23.
//

import SwiftUI

struct InfiniteScrollView: View {
    
    @ObservedObject var obj = AnimalArrayObject()
    @State var nextIndex = 1
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(obj.animals.indices, id: \.self) { index in
                        let animal = obj.animals[index]
                        Text("\(animal.emoji) \(animal.name)")
                            .padding(.vertical, 30)
                            .onAppear {
                                if index == obj.animals.count - 2 {
                                    obj.getAnimals(at: nextIndex)
                                    nextIndex += 1
                                }
                            }
                    }
                }
            }
            .navigationTitle("Animals")
        }
    }
}

struct InifiniteScrollView_Previews: PreviewProvider {
    static var previews: some View {
        InfiniteScrollView()
    }
}
