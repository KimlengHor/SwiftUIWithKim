//
//  FoodListViewModel.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 7/24/23.
//

import Foundation
import SwiftUI

class FoodListViewModel: ObservableObject {
    @Published var foods: [Food]
    @Published var currentFood: Food
    
    init() {
        let foods = FoodListDataService.foods
        self.foods = foods
        currentFood = foods.first!
    }
    
    func showNextFood(food: Food) {
        withAnimation(.easeInOut) {
            currentFood = food
        }
    }
    
    func nextButtonPressed() {
        //Get the current index
        guard let currentIndex = foods.firstIndex(where: {$0 == currentFood}) else {
            print("Could not find current index in location array! Should never happen")
            return
        }
        
        //Check if the currentIndex is valid
        let nextIndex = currentIndex + 1
        guard foods.indices.contains(nextIndex) else {
            //Next index is Not valid
            //Restart from 0
            
            guard let firstFood = foods.first else {return}
            showNextFood(food: firstFood)
            return
        }
        
        showNextFood(food: foods[nextIndex])
    }
}
