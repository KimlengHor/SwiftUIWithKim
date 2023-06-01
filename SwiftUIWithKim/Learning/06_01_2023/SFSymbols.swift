//
//  SFSymbols.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 6/1/23.
//

import SwiftUI

struct SFSymbols: View {
    
    @State var progress: Double = 0
    
    var body: some View {
        VStack {
            Image(systemName: "speaker.wave.3.fill", variableValue: progress)
                .font(.system(size: 100))
            Slider(value: $progress, in: 0...1)
        }
        .padding()
    }
}

struct SFSymbols_Previews: PreviewProvider {
    static var previews: some View {
        SFSymbols()
    }
}
