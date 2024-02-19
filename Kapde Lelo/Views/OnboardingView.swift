//
//  OnboardingView.swift
//  Kapde Lelo
//
//  Created by Aman Raghuvanshi on 13/02/24.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var appState: ApplicationState
    @State var isCreateAccountViewPresented = false
    
    var body: some View {
        ZStack {
            Image("Male")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack {
                Spacer()
                
                VStack {
                    Text("Look Good, Feel Good")
                        .font(.custom(SF_PRO_TEXT_HEAVY, size: 25))
                        .padding(.top, 15)
                    
                    Text("Create your individual & unique style and look amazing everyday.")
                        .font(.custom(SF_PRO_TEXT_HEAVY, size: 15))
                        .multilineTextAlignment(.center)
                        .padding(.top, 1)
                        .foregroundStyle(.gray)
                        .padding(.bottom, 25)
                    
                    Button(action: {
                        appState.setAppState(state: .login)
                    }, label: {
                        Text("Get Started")
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
                .background(.thickMaterial)
                .clipShape(.rect(cornerRadius: 20))
                .padding(.bottom, 70)
                .padding(.horizontal, 20)
            }
        }
        .background(Color(APP_MAIN_COLOR, bundle: nil))
        .onDisappear(perform: {
            UserDefaults.standard.set(false, forKey: IS_FIRST_TIME)
        })
    }
}

#Preview {
    OnboardingView()
}
