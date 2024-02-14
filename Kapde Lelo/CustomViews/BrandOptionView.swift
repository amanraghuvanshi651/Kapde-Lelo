//
//  BrandOptionView.swift
//  Kapde Lelo
//
//  Created by macmini50 on 14/02/24.
//

import SwiftUI

struct BrandOptionView: View {
    @Binding var brandName: String
    @Binding var image: String
    
    var body: some View {
        HStack(spacing: 10) {
            Image(image)
                .resizable()
                .frame(width: 40, height: 40)
            
            Text(brandName)
                .font(.custom(SF_PRO_TEXT_MEDIUM, fixedSize: 20))
        }
        .padding(10)
        .background(Color(BACKGROUND_HIGHLIGHT_COLOR, bundle: nil))
        .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    BrandOptionView(brandName: .constant("Adidas"), image: .constant("Adidas"))
}
