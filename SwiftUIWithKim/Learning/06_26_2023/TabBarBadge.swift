//
//  TabBarBadge.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 6/26/23.
//

import SwiftUI

struct TabBarBadge: View {
    var body: some View {
        TabView {
            Text("Home")
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .badge(100)
            Text("Search")
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .badge(300)
        }
        .font(.title)
    }
}

struct TabBarBadge_Previews: PreviewProvider {
    static var previews: some View {
        TabBarBadge()
    }
}
