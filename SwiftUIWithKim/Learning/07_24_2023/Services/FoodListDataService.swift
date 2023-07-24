//
//  FoodListDataService.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 7/24/23.
//

import Foundation

class FoodListDataService {
    static let foods: [Food] = [
        Food(
            imageUrlString: "https://content.hy-vee.com/remote.axd/3f4c2184e060ce99111b-f8c0985c8cb63a71df5cb7fd729edcab.ssl.cf2.rackcdn.com/media/16340/thaitofusalad.jpg?v=1&mode=crop&width=875&height=657",
            name: "Tofu Salad",
            description: "Tofu salad is a delightful and nutritious dish that features tofu as the main protein source, combined with a variety of fresh vegetables and flavorful dressings. It is a popular choice for vegetarians and vegans, but it's enjoyed by many for its light and refreshing taste."),
        
        Food(
            imageUrlString: "https://cloudinary-cdn.whisk.com/image/upload/g_auto,g_auto,c_fill,q_60,f_auto,h_600,w_800/v1645191441/v3/user-recipes/r738amhwltroyo6bpsl2.jpg",
            name: "Poke Bowl",
            description: "Originating from Hawaii, poke bowls consist of cubed raw fish (usually tuna or salmon) marinated in various sauces and served on a bed of rice, accompanied by toppings like avocado, seaweed, cucumber, and sesame seeds."),
        
        Food(
            imageUrlString: "https://popmenucloud.com/cdn-cgi/image/width%3D1200%2Cheight%3D1200%2Cfit%3Dscale-down%2Cformat%3Dauto%2Cquality%3D60/gncabvrs/1c237e7d-0e75-4016-9232-57640090cf30.JPG",
            name: "Acai Bowl",
            description: "A popular and colorful choice for a healthy breakfast or snack, açaí bowls are made with açaí berry puree topped with granola, fresh fruits, and sometimes nut butter or honey.")
    ]
}
