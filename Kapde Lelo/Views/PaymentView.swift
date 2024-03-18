//
//  PaymentView.swift
//  Kapde Lelo
//
//  Created by macmini50 on 27/02/24.
//

import SwiftUI

struct PaymentView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var appState: ApplicationState
    
    @State private var cards = [
        PaymentCardModel(number: "4564 8947 1234 9847", bank: "Axis", username: "Aman Raghuvanshi", bgImage: "card1", cardType: .mastercard),
        PaymentCardModel(number: "6544 3215 6541 3211", bank: "Indian Bank", username: "Ritik Joshi", bgImage: "card2", cardType: .rupay),
        PaymentCardModel(number: "1232 5465 8511 3214", bank: "SBI", username: "Abhay Raghuvanshi", bgImage: "card1", cardType: .visa),
        PaymentCardModel(number: "7575 5465 8954 5235", bank: "SBI", username: "Sanil Sarathe", bgImage: "card2", cardType: .rupay)
    ]
    @State private var isAddNewCardViewPresented = false
    
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
                    
                    Button {
                        isAddNewCardViewPresented = true
                    } label: {
                        Image("add")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    .navigationDestination(isPresented: $isAddNewCardViewPresented) {
                        AddNewCardView()
                    }
                }
                
                Text("Payment")
                    .font(.custom(SF_PRO_TEXT_BOLD, size: 17))
                    .foregroundStyle(.black)
            }
            .padding(.horizontal, 20)
            
            ScrollView {
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 0) {
                        ForEach($cards, id: \.id) { card in
                            PaymentCardView(card: card)
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width - 180)
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
                .scrollIndicators(.hidden)
                .padding(.bottom, 20)
                
                VStack(spacing: 20) {
                    CustomTextFieldWithBackgroundView(fieldTitle: .constant("Card Owner"), isValid: .constant(true), textfieldText: .constant("Aman"))
                    
                    CustomTextFieldWithBackgroundView(fieldTitle: .constant("Card Number"), isValid: .constant(true), textfieldText: .constant("Aman"))
                    
                    HStack(spacing: 20) {
                        CustomTextFieldWithBackgroundView(fieldTitle: .constant("EXP"), isValid: .constant(true), textfieldText: .constant("Aman"))
                        
                        CustomTextFieldWithBackgroundView(fieldTitle: .constant("CVV"), isValid: .constant(true), textfieldText: .constant("Aman"))
                    }
                }
                .padding(.horizontal, 20)
            }
            .scrollIndicators(.hidden)
            .contentMargins(.top, 30)
            
            Spacer()
            
            Button(action: {
            }, label: {
                Text("Select Card")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: 20)
            })
            .modifier(AppButtonBackground())
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    PaymentView()
}
