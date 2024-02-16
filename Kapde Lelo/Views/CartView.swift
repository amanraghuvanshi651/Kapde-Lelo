//
//  CartView.swift
//  Kapde Lelo
//
//  Created by macmini50 on 16/02/24.
//

import SwiftUI

struct CartView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var products = [
        ProductModel(name: "Nike Sportswear Club Fleece", category: "shirt", images: "Male2", price: "85", isLiked: false),
        ProductModel(name: "Trail Running Jacket Nike Windrunner", category: "shirt", images: "Male2", price: "124", isLiked: false),
        ProductModel(name: "Training Top Nike Sport Clash", category: "shirt", images: "Male2", price: "52", isLiked: false)
//        ProductModel(name: "Trail Running Jacket Nike Windrunner", category: "shirt", images: "Male2", price: "465", isLiked: false),
//        ProductModel(name: "Nike Sportswear Club Fleece", category: "shirt", images: "Male2", price: "242", isLiked: false),
//        ProductModel(name: "Trail Running Jacket Nike Windrunner", category: "shirt", images: "Male2", price: "74", isLiked: false),
//        ProductModel(name: "Training Top Nike Sport Clash", category: "shirt", images: "Male2", price: "81", isLiked: false),
//        ProductModel(name: "Trail Running Jacket Nike Windrunner", category: "shirt", images: "Male2", price: "96", isLiked: false),
//        ProductModel(name: "Nike Sportswear Club Fleece", category: "shirt", images: "Male2", price: "42", isLiked: false),
//        ProductModel(name: "Trail Running Jacket Nike Windrunner", category: "shirt", images: "Male2", price: "36", isLiked: false),
//        ProductModel(name: "Training Top Nike Sport Clash", category: "shirt", images: "Male2", price: "74", isLiked: false),
//        ProductModel(name: "Trail Running Jacket Nike Windrunner", category: "shirt", images: "Male2", price: "425", isLiked: false)
    ]
    
    var body: some View {
        VStack {
            //MARK - Top View
            ZStack {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image("Back")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    Spacer()
                }
                Text("Cart")
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            
            ScrollView {
                //MARK: - Product
                Section {
                    LazyVStack(spacing: 20) {
                        ForEach($products, id: \.id) { product in
                            CartProductView(product: product)
                                .padding(.horizontal, 20)
                        }
                    }
                }
                
                //MARK: - Address
                Section {
                    LazyVStack {
                        HStack {
                            Text("Delivery Address")
                                .font(.custom(SF_PRO_TEXT_MEDIUM, size: 20))
                            Spacer()
                            
                            Button {
                            } label: {
                                Image(systemName: "arrowshape.forward.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            }
                            .foregroundStyle(.black)
                        }
                    }
                    .padding(.horizontal, 20)
                }
                
                //MARK: - Payment
                Section {
                    LazyVStack {
                        HStack {
                            Text("Payment Method")
                                .font(.custom(SF_PRO_TEXT_MEDIUM, size: 20))
                            Spacer()
                            
                            Button {
                            } label: {
                                Image(systemName: "arrowshape.forward.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            }
                            .foregroundStyle(.black)

                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
            .contentMargins(.top, 10)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CartView()
}
