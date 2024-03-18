//
//  PaymentCardView.swift
//  Kapde Lelo
//
//  Created by Aman Raghuvanshi on 19/02/24.
//

import SwiftUI

struct PaymentMethodView: View {
    @Binding var cardType: CardProvider
    
    var body: some View {
        HStack(alignment: .center, spacing:15) {
            ZStack {
                Image(cardType.rawValue)
                    .resizable()
                    .scaledToFit()
                    .padding(5)
            }
            .frame(width: 60, height: 60)
            .background(Color(BACKGROUND_HIGHLIGHT_COLOR, bundle: nil))
            .clipShape(.rect(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 10) {
                Text(cardType.getTitle())
                    .font(.custom(SF_PRO_TEXT_MEDIUM, size: 18))
                    .padding(.top, 5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("✱✱✱✱ 5421")
                    .foregroundStyle(.gray)
                    .font(.custom(SF_PRO_TEXT_MEDIUM, size: 15))
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    PaymentMethodView(cardType: .constant(.rupay))
}
