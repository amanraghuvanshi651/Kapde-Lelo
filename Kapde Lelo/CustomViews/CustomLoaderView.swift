//
//  CustomLoaderView.swift
//  Kapde Lelo
//
//  Created by Aman Raghuvanshi on 16/02/24.
//

import SwiftUI

struct CustomLoaderView: View {
    var body: some View {
        ZStack {
            VStack {}
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.thinMaterial.opacity(0.5))
            
            LoaderView("loader")
                .frame(width: 100, height: 100)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    CustomLoaderView()
}
