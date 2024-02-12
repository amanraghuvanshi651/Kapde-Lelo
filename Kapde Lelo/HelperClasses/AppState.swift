//
//  AppState.swift
//  Kapde Lelo
//
//  Created by macmini50 on 12/02/24.
//

import SwiftUI

enum AppState {
    case login
    case tabView
}

class ApplicationState: ObservableObject {
    
    @Published private(set) var state: AppState = .login
    
    init() {
        if UserDefaults.standard.value(forKey: USER_KEY) != nil && UserDefaults.standard.value(forKey: USER_KEY) as? String != "" {
            state = .tabView
        } else {
            state = .login
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
