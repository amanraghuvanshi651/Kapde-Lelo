//
//  ContentView.swift
//  Kapde Lelo
//
//  Created by macmini50 on 09/02/24.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @EnvironmentObject var appState: ApplicationState
    
    @State var isUnlocked = false
        
    var body: some View {
        ZStack {
            switch appState.state {
            case .splash:
                SplashView()
            case .onboarding:
                OnboardingView()
            case .login:
                CreateAccountView()
            case .tabView:
                KapdeLeloTabView()
            }
            
            if !isUnlocked {
                VStack {
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.ultraThinMaterial)
            }
        }
        .onAppear {
            if !isUnlocked {
                authenticate()
            }
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your app."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                if success {
                    isUnlocked = true
                } else {
                    if error?.localizedDescription == "Biometry is not available." {
                        isUnlocked = true
                    } else {
                        isUnlocked = false
                    }
                }
            }
        } else {
            isUnlocked = true
        }
    }

}

#Preview {
    ContentView()
}
