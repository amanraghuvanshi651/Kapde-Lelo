//
//  MyCardsView.swift
//  Kapde Lelo
//
//  Created by Aman Raghuvanshi on 14/02/24.
//

import SwiftUI

struct MyCardsView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var appState: ApplicationState
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                Image("card1")
                    .resizable()
                    .padding(.horizontal, 20)
                    .aspectRatio(1.8, contentMode: .fill)
                    .shadow(color: .black.opacity(0.2),radius: 5)
                
                Image("card2")
                    .resizable()
                    .padding(.horizontal, 20)
                    .aspectRatio(1.8, contentMode: .fill)
                    .shadow(color: .black.opacity(0.2),radius: 5)
            }
        }
        .contentMargins(.top, 70, for: .scrollContent)
    }
}

#Preview {
    MyCardsView()
}
