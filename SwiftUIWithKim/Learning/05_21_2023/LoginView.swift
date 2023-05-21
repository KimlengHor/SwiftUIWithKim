//
//  LoginView.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 5/21/23.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 35) {
                TextFieldWithLabel(title: "Email", value: $email)
                TextFieldWithLabel(title: "Password", value: $password)
                Spacer()
            }
            .navigationTitle("Sign In")
            .padding(.top, 60)
            .padding(.horizontal, 24)
            .background(Color.black.opacity(0.001))
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct TextFieldWithLabel: View {
    
    let title: String
    
    @Binding var value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.body)
                .bold()
            TextField(text: $value) {
                Text("Enter your \(title.lowercased()) here")
            }
            .textFieldStyle(.roundedBorder)
        }
    }
}
