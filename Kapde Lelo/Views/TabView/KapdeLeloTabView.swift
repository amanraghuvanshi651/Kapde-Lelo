//
//  KapdeLeloTabView.swift
//  Kapde Lelo
//
//  Created by Aman Raghuvanshi on 12/02/24.
//

import SwiftUI

struct KapdeLeloTabView: View {
    @EnvironmentObject var appState: ApplicationState
    
    @State var isCarViewPresented = false
    @State var presentSideMenu = false
    @State var selectedSideMenuTab = 0
    
    var body: some View {
        ZStack {
            TabView {
                HomeView()
                    .tabItem {
                        Text("Home")
                        Image("Home")
                    }
                
                WishlistView()
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
                
                MyCardsView()
                .tabItem {
                    Text("My Cards")
                    Image("Wallet")
                }
            }
            .tint(Color(APP_MAIN_COLOR, bundle: nil))
            .navigationBarBackButtonHidden(true)
            
            if presentSideMenu {
                VStack {
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.ultraThinMaterial)
                .ignoresSafeArea()
            }
            
            SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)))
            
            VStack {
                HStack {
                    Button {
                        withAnimation {
                            presentSideMenu.toggle()
                        }
                    } label: {
                        Image(presentSideMenu ? "cross" : "Menu")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    .rotationEffect(.degrees(presentSideMenu ? -90 : 0))
                    
                    Spacer()
                    
                    if !presentSideMenu {
                        Button {
                            isCarViewPresented.toggle()
                        } label: {
                            Image("Cart")
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        .navigationDestination(isPresented: $isCarViewPresented) {
                            CartView()
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 0)
                
                Spacer()
            }
        }
    }
}

#Preview {
    KapdeLeloTabView()
}
