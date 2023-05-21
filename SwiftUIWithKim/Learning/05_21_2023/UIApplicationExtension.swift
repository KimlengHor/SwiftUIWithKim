//
//  UIApplicationExtension.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 5/21/23.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
