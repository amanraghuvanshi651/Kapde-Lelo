//
//  ProductDetailView.swift
//  Kapde Lelo
//
//  Created by macmini50 on 20/02/24.
//

import SwiftUI

struct ProductDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var isCarViewPresented = false
    @State var array = [1,1,1,1]
    var body: some View {
        ZStack {
            
            VStack {
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .background(Color(BACKGROUND_HIGHLIGHT_COLOR, bundle: nil))
            
            //MARK: - Product View
            ScrollView {
                LazyVStack {
                    Image("Male2")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .aspectRatio(1.1, contentMode: .fit)
                        .padding(.bottom, 15)
                        .background(Color(BACKGROUND_HIGHLIGHT_COLOR, bundle: nil))
                        .padding(.bottom, 15)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Men's Printed Pullover Hoodie")
                                .font(.custom(SF_PRO_TEXT_REGULAR, size: 15))
                                .foregroundStyle(.gray)
                            
                            Text("Nike Club Fleece")
                                .font(.custom(SF_PRO_TEXT_BOLD, size: 20))
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text("Price")
                                .font(.custom(SF_PRO_TEXT_REGULAR, size: 15))
                                .foregroundStyle(.gray)
                            
                            Text("$120")
                                .font(.custom(SF_PRO_TEXT_BOLD, size: 20))
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                    
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 10) {
                            ForEach((1...5).reversed(), id: \.self) {_ in
                                Image("Male2")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .background(Color(BACKGROUND_HIGHLIGHT_COLOR, bundle: nil))
                                    .clipShape(.rect(cornerRadius: 10))
                                }
                        }
                    }
                    .padding(.bottom, 15)
                    .contentMargins(.horizontal, 20)
                    .scrollIndicators(.hidden)
                    
                    HStack(alignment: .center) {
                        Text("Size")
                            .font(.custom(SF_PRO_TEXT_BOLD, size: 20))
                        
                        Spacer()
                        
                        Button {
                        } label: {
                            Text("Size Guide")
                                .font(.custom(SF_PRO_TEXT_REGULAR, size: 15))
                                .foregroundStyle(.gray)
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 10) {
                            ForEach((1...5).reversed(), id: \.self) {_ in
                                Text("S")
                                    .font(.custom(SF_PRO_TEXT_BOLD, size: 20))
                                    .frame(width: 60, height: 60)
                                    .background(Color(BACKGROUND_HIGHLIGHT_COLOR, bundle: nil))
                                    .clipShape(.rect(cornerRadius: 10))
                                }
                        }
                    }
                    .contentMargins(.horizontal, 20)
                    .scrollIndicators(.hidden)
                    .padding(.bottom, 20)
                    
                    Text("Description")
                        .font(.custom(SF_PRO_TEXT_BOLD, size: 20))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 5)
                    
                    Text("The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with Read More..")
                        .font(.custom(SF_PRO_TEXT_REGULAR, size: 15))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .foregroundStyle(.gray)
                }
                .background(.white)
                
            }
            .background(Color(BACKGROUND_HIGHLIGHT_COLOR, bundle: nil))
            
            //MARK: - Top Button View
            VStack {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image("Back")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    
                    Spacer()
                    
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
                .padding(.horizontal, 20)
                .padding(.bottom, 0)
                
                Spacer()
            }
        }
    }
}

#Preview {
    ProductDetailView()
}