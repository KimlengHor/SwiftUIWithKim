//
//  FoodView.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 7/24/23.
//

import SwiftUI

struct FoodView: View {
    
    @EnvironmentObject private var vm: FoodListViewModel
    
    let food: Food
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: food.imageUrlString), content: { content in
                content.image?
                    .resizable()
                    .frame(maxHeight: 300)
            })
            .padding(.bottom, 20)
            
            VStack(alignment: .leading, spacing: 15) {
                Text(food.name)
                    .font(.headline)
                    .bold()
                Text(food.description)
                    .font(.subheadline)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        vm.nextButtonPressed()
                    } label: {
                        Text("Next")
                            .font(.headline)
                            .bold()
                    }
                    .padding(.vertical, 15)
                    .frame(width: 150)
                    .background(Color.yellow)
                    .cornerRadius(10)
                }
            }
            .padding()
        }
        .foregroundColor(.white)
        .frame(height: 570)
        .frame(maxWidth: .infinity)
        .background(Color.black)
        .cornerRadius(20)
        .padding(24)
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView(food: FoodListDataService.foods.first!)
            .environmentObject(FoodListViewModel())
    }
}
