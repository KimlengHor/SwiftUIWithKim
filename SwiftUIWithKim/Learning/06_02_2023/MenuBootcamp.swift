//
//  MenuBootcamp.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 6/2/23.
//

import SwiftUI

struct MenuBootcamp: View {
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Menu")
                        .font(.largeTitle)
                        .bold()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        VStack {
                            Button {
                                
                            } label: {
                                Text("View")
                            }
                            
                            Button {
                                
                            } label: {
                                Text("Edit")
                            }
                            
                            Divider()
                            
                            Button(role: .destructive) {
                                
                            } label: {
                                Text("Delete")
                            }
                            
                            Button(role: .destructive) {
                                
                            } label: {
                                Text("Sign out")
                            }
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle.fill")
                            .resizable()
                            .padding(8)
                            .frame(width: 44, height: 44)
                            .foregroundColor(Color.black)
                    }
                }
            }
        }
    }
}

struct MenuBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MenuBootcamp()
    }
}
