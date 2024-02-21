//
//  AppButtonBackground.swift
//  Kapde Lelo
//
//  Created by macmini50 on 21/02/24.
//

import SwiftUI

struct AppButtonBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(APP_MAIN_COLOR, bundle: nil))
            .clipShape(.rect(cornerRadius: 10))
            .padding(.horizontal, 20)
            .padding(.bottom, 15)
    }
}
