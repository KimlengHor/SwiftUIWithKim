//
//  CustomizedHeader.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 5/18/23.
//

import SwiftUI

struct CustomizedHeader: View {
    
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                CircleButtonView(imageName: "info")
                
                Spacer()
                
                Text(showPortfolio ? "Detail View" : "Main View")
                    .font(.headline)
                    .fontWeight(.heavy)
                    .animation(.none)
                
                Spacer()
                
                /*
                 1. The rotationEffect modifier is applied to the CircleButtonView, and it rotates the view by 180 degrees if the showPortfolio is true, or keeps it at 0 degrees otherwise.
                 2. The showPortfolio is toggled in the closure withAnimation allows the rotation animates smoothly.
                 3. You can use showPortfolio to conditionally show different views.
                 */
                CircleButtonView(imageName: "chevron.right")
                    .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                    .onTapGesture {
                        withAnimation(.spring()) {
                            showPortfolio.toggle()
                        }
                    }
            }
            
            Spacer()
        }
        .padding()
    }
}

struct CustomizedHeader_Previews: PreviewProvider {
    static var previews: some View {
        CustomizedHeader()
    }
}

struct CircleButtonView: View {
    
    var imageName: String
    
    var body: some View {
        Image(systemName: imageName)
            .font(.headline)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(.white)
            )
            .shadow(
                color: Color.gray,
                radius: 10
            )
    }
}
