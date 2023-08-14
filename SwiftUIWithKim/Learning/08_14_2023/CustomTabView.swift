//
//  CustomTabView.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 8/14/23.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case house
    case video
    case bell
    case trash
    case gearshape
}

struct CustomTabView: View {
    
    @State var selectedTab: Tab = .house
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    var body: some View {
        VStack {
            VStack {
                TabView(selection: $selectedTab) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        HStack {
                            Image(systemName: tab.rawValue)
                            Text("\(tab.rawValue.capitalized)")
                                .bold()
                        }
                        .tag(tab)
                    }
                }
            }
            Spacer()
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                        .scaleEffect(selectedTab == tab ? 1.25 : 1)
                        .foregroundColor(selectedTab == tab ? determineTabColor(selectedTab: selectedTab) : .gray)
                        .font(.system(size: 22))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .frame(width: nil, height: 80)
            .background(.ultraThinMaterial)
            .cornerRadius(10)
            .padding()
        }
    }
    
    func determineTabColor(selectedTab: Tab) -> Color {
        switch(selectedTab) {
        case .house:
            return .red
        case .video:
            return .yellow
        case .bell:
            return .blue
        case .trash:
            return .green
        case .gearshape:
            return .purple
        }
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
