//
//  CartProductView.swift
//  Kapde Lelo
//
//  Created by macmini50 on 16/02/24.
//

import SwiftUI

struct CartProductView: View {
    @Binding var product: ProductModel
    
    var body: some View {
        HStack {
            Image(product.images)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 110, height: 110)
//                .padding(10)
                .background(Color(BACKGROUND_HIGHLIGHT_COLOR, bundle: nil))
                .clipShape(.rect(cornerRadius: 10))
            
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.custom(SF_PRO_TEXT_MEDIUM, size: 20))
                
                Text("$\(product.price)")
                    .font(.custom(SF_PRO_TEXT_MEDIUM, size: 15))
                    .padding(.vertical, 10)
                    .foregroundStyle(.gray)
                
                HStack {
                    Button {
                    } label: {
                        Image("upIcon", bundle: nil)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 25, height: 25)
                    }
                    .padding(.trailing, 15)
                    
                    Text("1")
                        .padding(.trailing, 15)
                    
                    Button {
                    } label: {
                        Image("downIcon", bundle: nil)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 25, height: 25)
                    }
                    
                    Spacer()
                    
                    Button {
                    } label: {
                        Image("deleteIcon", bundle: nil)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 25, height: 25)
                    }
                    .padding(.trailing, 10)

                }
            }
            .padding(.leading, 15)
            .padding(.trailing, 10)
        }
        .frame(maxWidth: .infinity)
        .padding(10)
        .background(.white)
        .clipShape(.rect(cornerRadius: 10))
        .shadow(color: .black.opacity(0.2), radius:3)
    }
}

#Preview {
    CartProductView(product: .constant(ProductModel(name: "Nike Sportswear Club Fleece", category: "shirt", images: "Male2", price: "85", isLiked: false)))
}
