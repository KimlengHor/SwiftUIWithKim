//
//  ExpandableListView.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 7/26/23.
//

import SwiftUI

struct ExpandableListView: View {
    
    @State private var showFoodListView = false
    
    var body: some View {
        VStack {
            VStack {
                Button {
                    withAnimation {
                        showFoodListView.toggle()
                    }
                } label: {
                    Text("Foods")
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .frame(height: 70)
                        .overlay(alignment: .leading) {
                            Image(systemName: "arrow.down")
                                .font(.headline)
                                .padding()
                                .rotationEffect(Angle(degrees: showFoodListView ? 180 : 0))
                        }
                }
                
                if showFoodListView {
                    foodListView
                        .frame(maxHeight: 280)
                }
            }
            .foregroundColor(.primary)
            .background(.thinMaterial)
            .cornerRadius(12)
            .padding()
            
            Spacer()
        }
    }
}

struct ExpandableListView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableListView()
    }
}

extension ExpandableListView {
    private func foodRowView(food: Food) -> some View {
        HStack(spacing: 24) {
            AsyncImage(url: URL(string: food.imageUrlString), content: { content in
                content.image?
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            })
            
            Text(food.name)
                .font(.headline)
        }
    }
    
    private var foodListView: some View {
        List {
            ForEach(FoodListDataService.foods) { food in
                foodRowView(food: food)
                    .padding(.vertical, 4)
                    .listRowBackground(Color.clear)
            }
        }
        .listStyle(.plain)
    }
}
