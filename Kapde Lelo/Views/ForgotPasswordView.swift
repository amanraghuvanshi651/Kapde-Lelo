//
//  ForgotPasswordView.swift
//  Kapde Lelo
//
//  Created by macmini50 on 13/02/24.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var emailText = ""
    @State var isEmailTextValid = false
    
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
            
            Text("Forgot Password")
                .font(.custom(SF_PRO_TEXT_HEAVY, size: 28))
            
            Image("Ilus1")
                .resizable()
                .aspectRatio(1.5, contentMode: .fit)
            
            CustomTextFieldView(fieldTitle: .constant("Email Address"), isValid: $isEmailTextValid, textfieldText: $emailText)
            
            Spacer()
            
            Text("Please write your email to receive a confirmation code to set a new password.")
                .foregroundStyle(.gray)
                .font(.custom(SF_PRO_TEXT_REGULAR, size: 15))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .padding(.bottom, 5)
            
            Button(action: {}, label: {
                Text("Confirm Mail")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: 20)
            })
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(APP_MAIN_COLOR, bundle: nil))
            .clipShape(.rect(cornerRadius: 10))
            .padding(.horizontal, 20)
            .padding(.bottom, 15)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ForgotPasswordView()
}
