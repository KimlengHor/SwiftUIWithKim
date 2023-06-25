//
//  SoundsEffect.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 6/22/23.
//

import SwiftUI
import AVKit

class SoundManager {
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case duck
        case tada
    }
    
    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error playing sound", error.localizedDescription)
        }
    }
}

struct SoundEffects: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Play sound 1") {
                SoundManager.instance.playSound(sound: .tada)
            }
            Button("Play sound 2") {
                SoundManager.instance.playSound(sound: .duck)
            }
        }
    }
}

struct SoundEffects_Previews: PreviewProvider {
    static var previews: some View {
        SoundEffects()
    }
}
