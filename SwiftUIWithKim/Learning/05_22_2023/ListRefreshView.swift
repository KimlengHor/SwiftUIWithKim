//
//  ListRefreshView.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 5/22/23.
//

import SwiftUI

/*
 In SwiftUI, you can apply a rotation effect to an SF Symbol using the rotationEffect modifier.
 */

struct ListRefreshView: View {
    
    @State var isLoading = false
    
    var body: some View {
        Button {
            withAnimation(.linear(duration: 2.0)) {
                isLoading = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    isLoading = false
                }
            }
        } label: {
            VStack {
                Image(systemName: "goforward")
                    .scaleEffect(2)
                    .rotationEffect(Angle(degrees: isLoading ? 360 : 0), anchor: .center)
                    .foregroundColor(Color(.label))
            }
            .padding(27)
            .background(.thickMaterial)
            .cornerRadius(10)
        }
    }
}

struct ListRefreshView_Previews: PreviewProvider {
    static var previews: some View {
        ListRefreshView()
    }
}
