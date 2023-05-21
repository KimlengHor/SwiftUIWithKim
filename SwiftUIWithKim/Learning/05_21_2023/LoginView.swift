//
//  LoginView.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 5/21/23.
//

import SwiftUI

/*
 In SwiftUI, it's crucial to create a seamless and intuitive user interface. When users want to interact with something other than a TextField, dismissing the keyboard promptly can make a significant difference. By implementing tab to dismiss, we can achieve just that!

 In the SignIn view, I've incorporated the tab to dismiss keyboard functionality to enhance the user experience. Now, users can effortlessly dismiss the keyboard and interact with other elements on the screen. Check out my SignIn view on GitHub:


 Remember, creating a smooth user experience is paramount for any app. By enabling tab view  to dismiss the keyboard, we can empower users to effortlessly navigate and interact with our SwiftUI app.
 */

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
