//
//  ResetPasswordView.swift
//  Kapde Lelo
//
//  Created by Aman Raghuvanshi on 13/02/24.
//

import SwiftUI

struct ResetPasswordView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var passwordText = ""
    @State var confirmPasswordText = ""
    
    @State var isPasswordTextValid = false
    @State var isConfirmPasswordTextValid = false
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image("Back")
                        .resizable()
                        .frame(width: 50, height: 50)
                })
                Spacer()
            }
            .padding(.horizontal, 20)
            
            Text("New Password")
                .font(.custom(SF_PRO_TEXT_HEAVY, size: 28))
                .padding(.bottom, 50)
                        
            VStack(spacing: 20) {
                CustomTextFieldView(fieldTitle: .constant("Password"), isValid: $isPasswordTextValid, textfieldText: $passwordText)
                CustomTextFieldView(fieldTitle: .constant("Confirm Password"), isValid: $isConfirmPasswordTextValid, textfieldText: $confirmPasswordText)
            }
            
            Spacer()
            
            Text("Please write your new password.")
                .foregroundStyle(.gray)
                .font(.custom(SF_PRO_TEXT_REGULAR, size: 15))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .padding(.bottom, 5)
            
            Button(action: {}, label: {
                Text("Sign Up")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: 20)
            })
            .modifier(AppButtonBackground())
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ResetPasswordView()
}
