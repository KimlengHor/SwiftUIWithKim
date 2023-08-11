//
//  WrapHStackView.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 8/11/23.
//

import SwiftUI

struct WrapHStackView: View {
    
    let knowledges = [
        "Swift programming language",
        "UIKit framework",
        "Core Data",
        "Auto Layout",
        "Xcode IDE",
        "App Store Connect",
        "ARKit",
        "Core Animation",
        "Apple Pay",
        "CocoaTouch framework",
        "Core Location",
        "In-App Purchases",
        "Push Notifications",
        "TestFlight",
        "HealthKit",
        "SiriKit",
        "Face ID",
        "Metal framework",
        "UIKit Dynamics",
        "Interface Builder",
      ]
    
    var body: some View {
        ScrollView {
            VStack {
                knowledgesTopic
                
                Spacer()
            }
            .padding(24)
        }
        .navigationTitle("iOS Knowledge")
    }
}

struct WrapHStackView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            WrapHStackView()
        }
    }
}

extension WrapHStackView {
    
    private var knowledgesTopic: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
    }
    
    private func generateContent(in g: GeometryProxy) -> some View {
            var width = CGFloat.zero
            var height = CGFloat.zero

            return ZStack(alignment: .topLeading) {
                ForEach(self.knowledges, id: \.self) { interest in
                    self.item(for: interest)
                        .alignmentGuide(.leading, computeValue: { d in
                            if (abs(width - d.width) > g.size.width) {
                                width = 0
                                height -= d.height
                            }
                            let result = width
                            if interest == self.knowledges.last! {
                                width = 0
                            } else {
                                width -= d.width
                            }
                            return result
                        })
                        .alignmentGuide(.top, computeValue: {d in
                            let result = height
                            if interest == self.knowledges.last! {
                                height = 0
                            }
                            return result
                        })
                }
            }
        }

        func item(for text: String) -> some View {
            Button {
            
            } label: {
                Text(text)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .bold()
                    .foregroundColor(Color.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.orange, lineWidth: 1.5)
                    )
                    .padding([.trailing, .bottom], 16)
            }
        }
}
