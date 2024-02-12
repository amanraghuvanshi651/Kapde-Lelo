//
//  SignUpView.swift
//  Kapde Lelo
//
//  Created by macmini50 on 12/02/24.
//

import SwiftUI

struct SignUpView: View {
    @State var isUsernameTextValid = false
    @State var usernameText = ""
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {}, label: {
                    Image("Back")
                        .resizable()
                        .frame(width: 50, height: 50)
                })
                Spacer()
            }
            .padding(.horizontal, 20)
            
            Text("Signup")
                .font(.custom(SFProDisplayBold, size: 28))
            
            Spacer()
            
            VStack(spacing: 15) {
                CustomTextFieldView(fieldTitle: .constant("Username"), isValid: $isUsernameTextValid, textfieldText: $usernameText)
                CustomTextFieldView(fieldTitle: .constant("Password"), isValid: $isUsernameTextValid, textfieldText: $usernameText)
                CustomTextFieldView(fieldTitle: .constant("Email Address"), isValid: $isUsernameTextValid, textfieldText: $usernameText)
            }
            
            Spacer()
            
            Button(action: {}, label: {
                Text("Sign Up")
                    .foregroundStyle(.white)
            })
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .clipShape(.rect(cornerRadius: 10))
            .padding(.horizontal, 20)
            .padding(.bottom, 15)
        }
    }
}

#Preview {
    SignUpView()
}
