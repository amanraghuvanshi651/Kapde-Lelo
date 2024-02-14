//
//  HomeView.swift
//  Kapde Lelo
//
//  Created by macmini50 on 14/02/24.
//

import SwiftUI

struct HomeView: View {
    @State var searchText = ""
    
    var body: some View {
        ZStack {
            ScrollView {
                Section {
                    VStack {
                        Text("Hello")
                            .font(.custom(SF_PRO_TEXT_MEDIUM, size: 30))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Welcome to Kapde Lelo.")
                            .font(.custom(SF_PRO_TEXT_REGULAR, size: 15))
                            .foregroundStyle(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.vertical, 20)
                }
                .padding(.horizontal, 20)
                
                Section {
                    HStack {
                        HStack {
                            Image("Search")
                                .resizable()
                                .frame(width: 20, height: 20)
                            
                            TextField("Search...", text: $searchText)
                                .frame(height: 30)
                        }
                        .padding(10)
                        .background(Color(BACKGROUND_HIGHLIGHT_COLOR, bundle: nil))
                        .clipShape(.rect(cornerRadius: 10))
                        
                        Button(action: {}, label: {
                            Image(systemName: "mic")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.white)
                                .frame(width: 25, height: 25)
                        })
                        .frame(width: 50, height: 50)
                        .background(Color(APP_MAIN_COLOR, bundle: nil))
                        .clipShape(.rect(cornerRadius: 10))
                    }
                }
                .padding(.horizontal, 20)
                
                Section {
                    Text("Choose brand")
                        .font(.custom(SF_PRO_TEXT_REGULAR, size: 20))
//                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                    
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 10) {
                            BrandOptionView(brandName: .constant("Adidas"), image: .constant("Adidas"))
                            BrandOptionView(brandName: .constant("Nike"), image: .constant("Nike"))
                            BrandOptionView(brandName: .constant("Fila"), image: .constant("Fila"))
                            BrandOptionView(brandName: .constant("Puma"), image: .constant("Puma"))
                        }
                    }
                    .contentMargins(.leading, 20)
                }
                
                Section {
                    LazyVGrid(columns: [GridItem(), GridItem()], spacing: 15, content: {
                        ProductCardView()
                        ProductCardView()
                        ProductCardView()
                        ProductCardView()
                        ProductCardView()
                        ProductCardView()
                        ProductCardView()
                        ProductCardView()
                    })
                }
                .padding(.horizontal, 20)
            }
            .scrollIndicators(.hidden)
            .contentMargins(.top, 50, for: .scrollContent)
//            .padding(.horizontal, 20)
            
            VStack {
                HStack {
                    Button {
                    } label: {
                        Image("Menu")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    
                    Spacer()
                    
                    Button {
                    } label: {
                        Image("Cart")
                            .resizable()
                            .frame(width: 50, height: 50)
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
    HomeView()
}
