//
//  SplashView.swift
//  Kapde Lelo
//
//  Created by Aman Raghuvanshi on 13/02/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack{
            Image("AppLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
//        .background(Color(BACKGROUND_HIGHLIGHT_COLOR, bundle: nil))
    }
}

#Preview {
    SplashView()
}
