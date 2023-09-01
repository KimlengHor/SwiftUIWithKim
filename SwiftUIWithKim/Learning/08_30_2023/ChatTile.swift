//
//  CornerRadiusStyle.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 8/30/23.
//

import SwiftUI

struct ChatTile: View {
    var body: some View {
        VStack(spacing: 7) {
            HStack {
                Text("Do you want to go to the party this weekend?")
                Spacer()
            }
            
            HStack {
                Spacer()
                Text("2:14 PM")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
        .padding(10)
        .background(.white)
        .frame(maxWidth: 226)
        .cornerRadius(radius: 20, corners: [.topLeft, .topRight, .bottomRight])
        .shadow(color: .gray.opacity(0.2), radius: 30)
    }
}

struct CornerRadiusStyle_Previews: PreviewProvider {
    static var previews: some View {
        ChatTile()
    }
}

struct CornerRadiusShape: Shape {
    var radius = CGFloat.infinity
    var corners = UIRectCorner.allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}


