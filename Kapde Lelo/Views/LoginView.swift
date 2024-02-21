//
//  LoginView.swift
//  Kapde Lelo
//
//  Created by Aman Raghuvanshi on 12/02/24.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var usernameText = ""
    @State var passwordText = ""
    
    @State var isUsernameTextValid = false
    @State var isPasswordTextValid = false
    
    @State var isForgotPasswordViewPresented = false
    @State var isTabViewPresented = false
    
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
            
            Text("Welcome")
                .font(.custom(SF_PRO_TEXT_HEAVY, size: 28))
            
            Text("Please enter your data to continue")
                .foregroundStyle(.gray)
                .padding(.top, 2)
                .padding(.bottom, 50)
                        
            VStack(spacing: 20) {
                CustomTextFieldView(fieldTitle: .constant("Username"), isValid: $isUsernameTextValid, textfieldText: $usernameText)
                CustomTextFieldView(fieldTitle: .constant("Password"), isValid: $isPasswordTextValid, textfieldText: $passwordText)
            }
            
            HStack {
                Spacer()
                
                Button(action: {
                    isForgotPasswordViewPresented = true
                }, label: {
                    Text("Forgot Password?")
                        .font(.custom(SF_PRO_TEXT_REGULAR, size: 12))
                        .foregroundStyle(.red)
                })
                .navigationDestination(isPresented: $isForgotPasswordViewPresented) {
                    ForgotPasswordView()
                }
            }
            .padding(20)
            
            Spacer()
            
            HStack(spacing: 3) {
                (Text("By connecting your account confirm that you agree with our ")
                    .foregroundStyle(.gray)
                 +
                 Text("Term and Condition")
                    .foregroundStyle(.black)
//                    .onTapGesture {
//                        print("tapped")
//                    }
                )
                .font(.custom(SF_PRO_TEXT_REGULAR, size: 15))
                .multilineTextAlignment(.center)
                .padding(.bottom, 15)
//                Button("Signin") {
////                    isSignInViewPresented = true
//                }
//                .navigationDestination(isPresented: $isSignInViewPresented) {
//                }
            }
            .padding(.horizontal, 20)
            
            Button(action: {
                isTabViewPresented = true
            }, label: {
                Text("Login")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: 20)
            })
            .modifier(AppButtonBackground())
            .navigationDestination(isPresented: $isTabViewPresented) {
                KapdeLeloTabView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LoginView()
}
