//
//  AppState.swift
//  Kapde Lelo
//
//  Created by macmini50 on 12/02/24.
//

import SwiftUI

enum AppState {
    case splash
    case onboarding
    case login
    case tabView
}

class ApplicationState: ObservableObject {
    
    @Published private(set) var state: AppState = .splash
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if UserDefaults.standard.value(forKey: USER_KEY) != nil && UserDefaults.standard.value(forKey: USER_KEY) as? String != "" {
                self.state = .tabView
            } else {
                self.state = UserDefaults.standard.value(forKey: IS_FIRST_TIME) != nil ? .login : .onboarding
            }
        }
    }
    
    func setAppState(state: AppState) {
        withAnimation {
            if state == .login {
                UserDefaults.standard.set("", forKey: USER_KEY)
                UserDefaults.standard.set("", forKey: PASSWORD_KEY)
            }
            self.state = state
        }
    }
}
