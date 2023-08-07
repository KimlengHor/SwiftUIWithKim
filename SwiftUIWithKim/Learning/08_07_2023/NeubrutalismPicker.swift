//
//  NeubrutalismPicker.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 8/7/23.
//

import SwiftUI

enum PickerOption: String, CaseIterable, Identifiable {
    case first, second
    var id: Self { self }
}

struct NeubrutalismPicker: View {
    
    let firstOption: String
    let secondOption: String
    
    @Binding var selection: PickerOption
    
    var body: some View {
        ZStack(alignment: selection == .first ? .leading : .trailing) {
            VStack{}
            .frame(width: 267 / 2)
            .frame(maxHeight: .infinity)
            .background(Color.yellow.opacity(0.6))
            
            HStack(spacing: 0) {
                Button {
                    withAnimation(.easeInOut) {
                        selection = .first
                    }
                } label: {
                    if selection == .first {
                        selectedPickerButton(text: firstOption)
                    } else {
                        unselectedPickerButton(text: firstOption)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Button {
                    withAnimation(.easeInOut) {
                        selection = .second
                    }
                } label: {
                    if selection == .first {
                        unselectedPickerButton(text: secondOption)
                    } else {
                        selectedPickerButton(text: secondOption)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .padding(4)
        .withNeubrutalismDesign(width: 267, height: 48)
    }
    
    private func selectedPickerButton(text: String) -> some View {
        Text(text)
            .font(.callout)
            .bold()
    }
    
    private func unselectedPickerButton(text: String) -> some View {
        Text(text)
            .font(.callout)
            .foregroundColor(Color.gray)
    }
}

struct NeubrutalismPicker_Previews: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper(PickerOption.first) { selection in
            NeubrutalismPicker(firstOption: "First", secondOption: "Second", selection: selection)
        }
    }
}

struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State var value: Value
    var content: (Binding<Value>) -> Content

    var body: some View {
        content($value)
    }

    init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
        self._value = State(wrappedValue: value)
        self.content = content
    }
}

