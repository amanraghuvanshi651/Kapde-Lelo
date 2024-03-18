//
//  PaymentCardView.swift
//  Kapde Lelo
//
//  Created by macmini50 on 28/02/24.
//

import SwiftUI

struct PaymentCardView: View {
    @Binding var card: PaymentCardModel
    
    var body: some View {
        ZStack {
            Image(card.bgImage)
                .resizable()
                .scaledToFit()
            VStack {
                HStack(alignment: .center) {
                    Text(card.bank)
                        .font(.custom(SF_PRO_TEXT_BOLD, size: 30))
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Image(card.cardType.rawValue)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
                .padding(.top, 15)
                .padding(.bottom, 70)
                .padding(.horizontal, 25)
                
                
                Text(card.number)
                    .font(.custom(SF_PRO_TEXT_REGULAR, size: 20))
                    .padding(.horizontal, 25)
                    .tracking(4)
                    .lineSpacing(1.0)
                    .padding(.bottom, 15)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(card.username)
                    .font(.custom(SF_PRO_TEXT_REGULAR, size: 20))
                    .padding(.horizontal, 25)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineSpacing(1.0)
                    .foregroundStyle(.white)
                    .padding(.bottom, 20)
            }
        }
        .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    PaymentCardView(card: .constant(PaymentCardModel(number: "5421 5214 4125 8452", bank: "Axis", username: "Aman Raghuvanshi", bgImage: "card1", cardType: .mastercard)))
        .previewLayout(.sizeThatFits)
}
