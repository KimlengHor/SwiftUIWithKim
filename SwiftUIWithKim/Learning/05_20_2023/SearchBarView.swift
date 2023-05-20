//
//  SearchBarView.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 5/20/23.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    Color(.label)
                )
            
            TextField("Search", text: $searchText)
                .foregroundColor(Color(.label))
                .disableAutocorrection(true)
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(.systemBackground))
                .shadow(
                    color: Color.gray.opacity(0.15),
                    radius: 10,
                    x: 0,
                    y: 0
                )
        )
        .padding(.horizontal)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
    }
}
