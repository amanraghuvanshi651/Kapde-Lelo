//
//  Kapde_LeloApp.swift
//  Kapde Lelo
//
//  Created by macmini50 on 09/02/24.
//

import SwiftUI

@main
struct Kapde_LeloApp: App {
    @StateObject var appState = ApplicationState()
    var body: some Scene {
        WindowGroup {
            NavigationStack {            
                ContentView()
            }
            .environmentObject(appState)
        }
    }
}
