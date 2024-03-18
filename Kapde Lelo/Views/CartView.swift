//
//  CartView.swift
//  Kapde Lelo
//
//  Created by Aman Raghuvanshi on 16/02/24.
//

import SwiftUI
import QuartzCore

struct CartView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var appState: ApplicationState
    
    @State var products = [
        ProductModel(name: "Nike Sportswear Club Fleece", category: "shirt", images: "Male2", price: "85", isLiked: false),
        ProductModel(name: "Trail Running Jacket Nike Windrunner", category: "shirt", images: "Male2", price: "124", isLiked: false),
        ProductModel(name: "Training Top Nike Sport Clash", category: "shirt", images: "Male2", price: "52", isLiked: false)
    ]
    @State var isPaymentStatusViewPresented = false
    @State var isPaymentViewPresented = false
    
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
                                Image("rightArrow")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            }
                            .foregroundStyle(.black)
                        }
                        
                        AddressView()
                    }
                    .padding(20)
                }
                
                //MARK: - Payment
                Section {
                    LazyVStack {
                        HStack {
                            Text("Payment Method")
                                .font(.custom(SF_PRO_TEXT_MEDIUM, size: 20))
                            Spacer()
                            
                            Button {
                                isPaymentViewPresented = true
                            } label: {
                                Image("rightArrow")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            }
                            .foregroundStyle(.black)
                            .navigationDestination(isPresented: $isPaymentViewPresented) {
                                PaymentView()
                            }

                        }
                        
                        PaymentMethodView(cardType: .constant(.rupay))
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                }
                
                //MARK: - Total
                Section {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Order Info")
                            .font(.custom(SF_PRO_TEXT_MEDIUM, size: 20))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 5)
                        
                        HStack {
                            Text("Subtotal")
                                .font(.custom(SF_PRO_TEXT_MEDIUM, size: 17))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(.gray)
                            
                            Spacer()
                            
                            Text("$110")
                                .font(.custom(SF_PRO_TEXT_MEDIUM, size: 20))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        
                        HStack {
                            Text("Shipping cost")
                                .font(.custom(SF_PRO_TEXT_MEDIUM, size: 17))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(.gray)
                            
                            Spacer()
                            
                            Text("$10")
                                .font(.custom(SF_PRO_TEXT_MEDIUM, size: 20))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        
                        HStack {
                            Text("Total")
                                .font(.custom(SF_PRO_TEXT_MEDIUM, size: 17))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(.gray)
                            Spacer()
                            
                            Text("$120")
                                .font(.custom(SF_PRO_TEXT_MEDIUM, size: 20))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                }
                
                Section {
                    NavigationLink {
                        PaymentStatusView()
                    } label: {
                        Text("Checkout")
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, maxHeight: 20)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(APP_MAIN_COLOR, bundle: nil))
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(.horizontal, 20)
                    .padding(.bottom, 15)
                    
//                    Button(action: {
//                        isPaymentStatusViewPresented = true
//                    }, label: {
//                        Text("Checkout")
//                            .foregroundStyle(.white)
//                            .frame(maxWidth: .infinity, maxHeight: 20)
//                    })
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(Color(APP_MAIN_COLOR, bundle: nil))
//                    .clipShape(.rect(cornerRadius: 10))
//                    .padding(.horizontal, 20)
//                    .padding(.bottom, 15)
//                    .navigationDestination(isPresented: $isPaymentStatusViewPresented) {
//                        PaymentStatusView()
//                    }
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
