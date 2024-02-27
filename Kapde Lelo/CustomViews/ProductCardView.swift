//
//  ProductCardView.swift
//  Kapde Lelo
//
//  Created by Aman Raghuvanshi on 14/02/24.
//

import SwiftUI

struct ProductCardView: View {
    @Binding var product: ProductModel
    
    var body: some View {
        VStack {
            ZStack {
                Image(product.images)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack {
                    HStack {
                        Spacer()
                        
                        Image(product.isLiked ? "RedHeart" : "Heart")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(product.isLiked ? Color.red : Color(PRODUCT_HEART_GRAY_COLOR, bundle: nil))
                            .onTapGesture {
                                product.isLiked.toggle()
                            }
                    }
                    .padding()
                    Spacer()
                }
            }
            .background(Color(BACKGROUND_HIGHLIGHT_COLOR, bundle: nil))
            .clipShape(.rect(cornerRadius: 20))
            
            Text(product.name)
                .font(.custom(SF_PRO_TEXT_REGULAR, size: 15))
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .padding(.top, 5)
            
            Text("$\(product.price)")
                .font(.custom(SF_PRO_TEXT_HEAVY, size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 5)
        }
    }
}

#Preview {
    ProductCardView(product: .constant(ProductModel(name: "Nike Sportswear Club Fleece", category: "shirt", images: "Male2", price: "85", isLiked: false)))
}
