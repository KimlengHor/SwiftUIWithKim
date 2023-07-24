//
//  Food.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 7/24/23.
//

import Foundation

struct Food: Identifiable, Equatable {
    let imageUrlString: String
    let name: String
    let description: String
    
    //Identifiable
    var id: String {
         name
    }
    
    //Equatable
    static func == (lhs: Food, rhs: Food) -> Bool {
        return lhs.id == rhs.id
    }
}
