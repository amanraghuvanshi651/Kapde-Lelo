//
//  ProductCardView.swift
//  Kapde Lelo
//
//  Created by macmini50 on 14/02/24.
//

import SwiftUI

struct ProductCardView: View {
    var body: some View {
        VStack {
            ZStack {
                Image("Male2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack {
                    HStack {
                        Spacer()
                        
                        Image("Heart")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(Color(PRODUCT_HEART_GRAY_COLOR, bundle: nil))
                    }
                    .padding()
                    Spacer()
                }
            }
            .background(Color(BACKGROUND_HIGHLIGHT_COLOR, bundle: nil))
            .clipShape(.rect(cornerRadius: 20))
//            .frame(maxHeight: 500)
            
            Text("Nike Sportswear Club Fleece")
                .font(.custom(SF_PRO_TEXT_REGULAR, size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
//                .background(.cyan)
                .padding(.top, 5)
//                .padding(.bottom, 2)
            
            Text("$99")
                .font(.custom(SF_PRO_TEXT_HEAVY, size: 25))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 5)
        }
//        .frame(maxWidth: 150)
//        .clipShape(.rect(cornerRadius: 20))
    }
}

#Preview {
    ProductCardView()
}
