//
//  WishlistView.swift
//  Kapde Lelo
//
//  Created by Aman Raghuvanshi on 14/02/24.
//

import SwiftUI

struct WishlistView: View {
    @State var products = [
        ProductModel(name: "Nike Sportswear Club Fleece", category: "shirt", images: "Male2", price: "85", isLiked: true),
        ProductModel(name: "Trail Running Jacket Nike Windrunner", category: "shirt", images: "Male2", price: "124", isLiked: true),
        ProductModel(name: "Training Top Nike Sport Clash", category: "shirt", images: "Male2", price: "52", isLiked: true),
        ProductModel(name: "Trail Running Jacket Nike Windrunner", category: "shirt", images: "Male2", price: "465", isLiked: true),
        ProductModel(name: "Nike Sportswear Club Fleece", category: "shirt", images: "Male2", price: "242", isLiked: true),
        ProductModel(name: "Trail Running Jacket Nike Windrunner", category: "shirt", images: "Male2", price: "74", isLiked: true),
        ProductModel(name: "Training Top Nike Sport Clash", category: "shirt", images: "Male2", price: "81", isLiked: true),
        ProductModel(name: "Trail Running Jacket Nike Windrunner", category: "shirt", images: "Male2", price: "96", isLiked: true),
        ProductModel(name: "Nike Sportswear Club Fleece", category: "shirt", images: "Male2", price: "42", isLiked: true),
        ProductModel(name: "Trail Running Jacket Nike Windrunner", category: "shirt", images: "Male2", price: "36", isLiked: true),
        ProductModel(name: "Training Top Nike Sport Clash", category: "shirt", images: "Male2", price: "74", isLiked: true),
        ProductModel(name: "Trail Running Jacket Nike Windrunner", category: "shirt", images: "Male2", price: "425", isLiked: true)
    ]
    
    var body: some View {
        ZStack {
            ScrollView {
                
                Section {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(products.count) Items")
                            Text("in wishlist")
                                .font(.custom(SF_PRO_TEXT_REGULAR, size: 15))
                                .foregroundStyle(.gray)
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
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
//                            ProductCardView(product: product)
                        }
                    })
                }
                .padding(.horizontal, 20)
            }
            .onChange(of: products, { oldValue, newValue in
                withAnimation {
                    products.removeAll { product in
                        !product.isLiked
                    }
                }
            })
            .scrollIndicators(.hidden)
            .contentMargins(.top, 70, for: .scrollContent)
        }
    }
}

#Preview {
    WishlistView()
}
