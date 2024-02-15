//
//  BrandOptionView.swift
//  Kapde Lelo
//
//  Created by macmini50 on 14/02/24.
//

import SwiftUI

struct BrandOptionView: View {
    @Binding var brand: BrandModel
//    @Binding var brandName: String
//    @Binding var image: String
    
    var body: some View {
        HStack(spacing: 10) {
            Image(brand.image)
                .resizable()
                .frame(width: 40, height: 40)
            
            Text(brand.name)
                .font(.custom(SF_PRO_TEXT_MEDIUM, fixedSize: 20))
        }
        .onTapGesture {
            brand.isSelected.toggle()
        }
        .padding(10)
        .background(brand.isSelected ? Color(APP_MAIN_COLOR, bundle: nil) : Color(BACKGROUND_HIGHLIGHT_COLOR, bundle: nil))
        .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    BrandOptionView(brand: .constant(BrandModel(name: "Adidas", image: "Adidas", isSelected: false)))
}
