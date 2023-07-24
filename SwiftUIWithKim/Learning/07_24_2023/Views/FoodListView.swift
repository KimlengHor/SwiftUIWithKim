//
//  FoodListView.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 7/24/23.
//

import SwiftUI

struct FoodListView: View {
    
    @EnvironmentObject private var vm: FoodListViewModel
    
    var body: some View {
        VStack {
            ForEach(vm.foods) { food in
                if vm.currentFood == food {
                    FoodView(food: food)
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)))
                }
            }
        }
    }
}

struct FoodListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodListView()
            .environmentObject(FoodListViewModel())
    }
}
