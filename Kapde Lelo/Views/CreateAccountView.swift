//
//  CreateAccountView.swift
//  Kapde Lelo
//
//  Created by macmini50 on 12/02/24.
//

import SwiftUI
import _AuthenticationServices_SwiftUI

struct CreateAccountView: View {
    @State var isSignInViewPresented = false
    @State var isLoginViewPresented = false
    
    var body: some View {
        ZStack {
            VStack {
                Text("Let's Get Started")
                    .font(.custom(SF_PRO_TEXT_HEAVY, size: 30))
                    .padding(.top, 30)
                
                Spacer()
                
                ZStack {
                    Image("Male2")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    VStack {
                        Spacer()
                        
                        Button(action: {}, label: {
                            HStack {
                                Image("Google", bundle: nil)
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                Text("Google")
                                    .font(.system(size: 20))
                                    .foregroundStyle(Color.black)
                            }
                            .frame(maxWidth: .infinity)
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .clipShape(.rect(cornerRadius: 10))
                        .shadow(color: .black.opacity(0.2), radius: 2)
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.bottom, 15)
                
                VStack(spacing: 15) {
                    SignInWithAppleButton { request in
                    } onCompletion: { result in
                    }
                    .frame(maxWidth: .infinity, maxHeight: 55)
                    .background(Color.white)
                    .clipShape(.rect(cornerRadius: 10))
                    .shadow(color: .black.opacity(0.2), radius: 2)
                    
                    Button(action: {
                        isSignInViewPresented = true
                    }, label: {
                        Text("Create an Account")
                            .font(.system(size: 20))
                            .foregroundStyle(.white)
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(APP_MAIN_COLOR, bundle: nil))
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(.bottom, 15)
                    .navigationDestination(isPresented: $isSignInViewPresented) {
                        SignUpView()
                    }
                }
                .padding(.horizontal, 20)
                
                HStack(spacing: 3) {
                    Text("Already have an account?")
                        .foregroundStyle(.gray)
                    Button("Login") {
                        isLoginViewPresented = true
                    }
                    .navigationDestination(isPresented: $isLoginViewPresented) {
                        LoginView()
                    }
                    .foregroundStyle(.black)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CreateAccountView()
}
