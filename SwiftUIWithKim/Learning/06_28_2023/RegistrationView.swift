//
//  RegistrationView.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 6/28/23.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    
    enum FocusedField: Hashable {
        case name, email, phoneNumber
    }
    
    @FocusState private var focusedField: FocusedField?
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                    .focused($focusedField, equals: .name)
                
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .focused($focusedField, equals: .email)
                
                TextField("Phone number", text: $phoneNumber)
                    .keyboardType(.phonePad)
                    .focused($focusedField, equals: .phoneNumber)
            }
            .navigationTitle("Registration")
            .onAppear {
                focusedField = .name
            }
            .onSubmit(focusNextField)
        }
    }
    
    private func focusNextField() {
        switch focusedField {
        case .name:
            focusedField = .email
        case .email:
            focusedField = .phoneNumber
        case .phoneNumber:
            focusedField = nil
        case .none:
            break
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
