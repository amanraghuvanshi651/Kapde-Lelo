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
            
            Text("Let's Get Started")
                .font(.custom(SFProDisplayBold, size: 30))
            
            Spacer()
            
            VStack(spacing: 15) {
                Button(action: {}, label: {
                    HStack {
                        Image("Google", bundle: nil)
                            .resizable()
                            .frame(width: 20, height: 20)
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
                
                ZStack {
                    VStack {
                        Divider()
                            .background(.black)
                    }
                    .padding(.horizontal, 20)
                    
                    Text("or")
                        .padding(.horizontal)
                        .background(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: 30, alignment: .center)
                
                SignInWithAppleButton { request in
                } onCompletion: { result in
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color.white)
                .clipShape(.rect(cornerRadius: 10))
                .shadow(color: .black.opacity(0.2), radius: 2)
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
            HStack(spacing: 3) {
                Text("Already have an account?")
                Button("Signin") {
                    isSignInViewPresented = true
                }
                .navigationDestination(isPresented: $isSignInViewPresented) {
                    HStack {
                    }
                }
            }
            
            Button(action: {}, label: {
                Text("Create an Account")
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
    CreateAccountView()
}
