//
//  KapdeLeloTabView.swift
//  Kapde Lelo
//
//  Created by macmini50 on 12/02/24.
//

import SwiftUI

struct KapdeLeloTabView: View {
    var body: some View {
//        VStack {
//            HStack {
//                Button {
//                } label: {
//                    Image("Menu")
//                        .resizable()
//                        .frame(width: 50, height: 50)
//                }
//
//                Spacer()
//                
//                Button {
//                } label: {
//                    Image("Cart")
//                        .resizable()
//                        .frame(width: 50, height: 50)
//                }
//            }
////            .padding(.top, 10)
//            .padding(.horizontal, 20)
            
            
            TabView {
                HomeView()
                .tabItem {
                    Text("Home")
                    Image("Home")
                }
                
                HStack {
                    Text("Wishlist")
                }
                .tabItem {
                    Text("Wishlist")
                    Image("Heart")
                }
                
                HStack {
                    Text("Order")
                }
                .tabItem {
                    Text("Order")
                    Image("Bag")
                }
                
                HStack {
                    Text("My Cards")
                }
                .tabItem {
                    Text("My Cards")
                    Image("Wallet")
                }
            }
            .tint(Color(APP_MAIN_COLOR, bundle: nil))
            .navigationBarBackButtonHidden(true)
//        }
    }
}

#Preview {
    KapdeLeloTabView()
}
