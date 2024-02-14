//
//  SignUpView.swift
//  Kapde Lelo
//
//  Created by macmini50 on 12/02/24.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var usernameText = ""
    @State var passwordText = ""
    @State var emailText = ""
    
    @State var isUsernameTextValid = false
    @State var isPasswordTextValid = false
    @State var isEmailTextValid = false
    
    @State var isCodeVerificationViewPresented = false
    
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
            
            Text("Signup")
                .font(.custom(SF_PRO_TEXT_HEAVY, size: 28))
                .padding(.bottom, 50)
                        
            VStack(spacing: 20) {
                CustomTextFieldView(fieldTitle: .constant("Username"), isValid: $isUsernameTextValid, textfieldText: $usernameText)
                CustomTextFieldView(fieldTitle: .constant("Password"), isValid: $isPasswordTextValid, textfieldText: $passwordText)
                CustomTextFieldView(fieldTitle: .constant("Email Address"), isValid: $isEmailTextValid, textfieldText: $emailText)
            }
            
            Spacer()
            
            Button(action: {
                isCodeVerificationViewPresented = true
            }, label: {
                Text("Sign Up")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: 20)
            })
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(APP_MAIN_COLOR, bundle: nil))
            .clipShape(.rect(cornerRadius: 10))
            .padding(.horizontal, 20)
            .padding(.bottom, 15)
            .navigationDestination(isPresented: $isCodeVerificationViewPresented) {
                CodeVerificationView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SignUpView()
}
