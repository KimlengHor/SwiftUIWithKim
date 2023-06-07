//
//  StringPluralization.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 6/7/23.
//

import SwiftUI

struct StringPluralization: View {
    
    var body: some View {
        VStack(spacing: 20) {
            Text("^[\(1) Person](inflect: true)")
            Text("^[\(2) Person](inflect: true)")
        }
    }
}

struct StringPluralization_Previews: PreviewProvider {
    static var previews: some View {
        StringPluralization()
    }
}
