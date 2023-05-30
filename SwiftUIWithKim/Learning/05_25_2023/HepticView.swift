//
//  Heptic.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 5/25/23.
//

import Foundation
import SwiftUI

class HepticManager {
    static let instance = HepticManager() //Singleton
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct HepticView: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("Success") { HepticManager.instance.notification(type: .success) }
            Button("Warning") { HepticManager.instance.notification(type: .warning) }
            Button("Error") { HepticManager.instance.notification(type: .error) }
            Divider()
            Button("Medium") { HepticManager.instance.impact(style: .medium)}
            Button("Heavy") { HepticManager.instance.impact(style: .heavy)}
            Button("Rigid") { HepticManager.instance.impact(style: .rigid)}
            Button("Soft") { HepticManager.instance.impact(style: .soft)}
            Button("Light") { HepticManager.instance.impact(style: .light)}
        }
    }
}

struct HepticView_Previews: PreviewProvider {
    static var previews: some View {
        HepticView()
    }
}
