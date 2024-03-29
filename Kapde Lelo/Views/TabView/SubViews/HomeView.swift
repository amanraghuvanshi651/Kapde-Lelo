//
//  HomeView.swift
//  Kapde Lelo
//
//  Created by Aman Raghuvanshi on 14/02/24.
//

import SwiftUI

enum Brand {
    case adidas
    case nike
    case fila
    case puma
}

struct HomeView: View {
    @EnvironmentObject var appState: ApplicationState
    
    @State var searchText = ""
    @State var isProductDetailViewPresented = false
    
    @State var products = [
        ProductModel(name: "Nike Sportswear Club Fleece", category: "shirt", images: "Male2", price: "85", isLiked: false),
        ProductModel(name: "Trail Running Jacket Nike Windrunner", category: "shirt", images: "Male2", price: "124", isLiked: false),
        ProductModel(name: "Training Top Nike Sport Clash", category: "shirt", images: "Male2", price: "52", isLiked: false),
        ProductModel(name: "Trail Running Jacket Nike Windrunner", category: "shirt", images: "Male2", price: "465", isLiked: false),
        ProductModel(name: "Nike Sportswear Club Fleece", category: "shirt", images: "Male2", price: "242", isLiked: false),
        ProductModel(name: "Trail Running Jacket Nike Windrunner", category: "shirt", images: "Male2", price: "74", isLiked: false),
        ProductModel(name: "Training Top Nike Sport Clash", category: "shirt", images: "Male2", price: "81", isLiked: false),
        ProductModel(name: "Trail Running Jacket Nike Windrunner", category: "shirt", images: "Male2", price: "96", isLiked: false),
        ProductModel(name: "Nike Sportswear Club Fleece", category: "shirt", images: "Male2", price: "42", isLiked: false),
        ProductModel(name: "Trail Running Jacket Nike Windrunner", category: "shirt", images: "Male2", price: "36", isLiked: false),
        ProductModel(name: "Training Top Nike Sport Clash", category: "shirt", images: "Male2", price: "74", isLiked: false),
        ProductModel(name: "Trail Running Jacket Nike Windrunner", category: "shirt", images: "Male2", price: "425", isLiked: false)
    ]
    
    @State var brands = [
        BrandModel(name: "Adidas", image: "Adidas", isSelected: false),
        BrandModel(name: "Nike", image: "Nike", isSelected: false),
        BrandModel(name: "Fila", image: "Fila", isSelected: false),
        BrandModel(name: "Puma", image: "Puma", isSelected: false)
    ]
    @State var showLoader = false
    
    var body: some View {
        ZStack {
            ScrollView {
                //MARK: - Top greating section
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
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                
                //MARK: - Search section
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
                
                //MARK: - Brand section
                Section {
                    Text("Choose brand")
                        .font(.custom(SF_PRO_TEXT_REGULAR, size: 20))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                    
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 10) {
                            ForEach($brands, id: \.id) { brand in
                                BrandOptionView(brand: brand)
                            }
                        }
                    }
                    .contentMargins(.leading, 20)
                }
                
                //MARK: - Product section
                Section {
                    LazyVGrid(columns: [GridItem(), GridItem()], spacing: 15, content: {
                        ForEach($products, id: \.id) { product in
                            NavigationLink {
                                ProductDetailView()
                            } label: {
                                ProductCardView(product: product)
                            }
                            .foregroundStyle(.black)
                            .buttonStyle(EmptyButtonStyle())

//                                .buttonStyle(PlainButtonStyle())
//                                .onTapGesture {
//                                    isProductDetailViewPresented = true
//                                }
//                                .navigationDestination(isPresented: $isProductDetailViewPresented) {
//                                    ProductDetailView()
//                                }
                        }
                    })
                }
                .padding(.horizontal, 20)
            }
            .scrollIndicators(.hidden)
            .contentMargins(.top, 70, for: .scrollContent)
            
            if showLoader {
                CustomLoaderView()
            }
        }
        .onAppear {
            withAnimation {
                self.showLoader = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.showLoader = false
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
