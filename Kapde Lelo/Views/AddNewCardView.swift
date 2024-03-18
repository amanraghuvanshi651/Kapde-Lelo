//
//  AddNewCardView.swift
//  Kapde Lelo
//
//  Created by macmini50 on 13/03/24.
//

import SwiftUI

struct AddNewCardView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var appState: ApplicationState
    
    @State private var cardOwnerText = ""
    @State private var cardNumberText = ""
    @State private var cardExpText = ""
    @State private var cardCVVText = ""
    
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
                
                Text("Add New Card")
                    .font(.custom(SF_PRO_TEXT_BOLD, size: 17))
                    .foregroundStyle(.black)
            }
            .padding(.horizontal, 20)
            
            ScrollView {
                VStack(spacing: 20) {
                    CustomTextFieldWithBackgroundView(fieldTitle: .constant("Card Owner"), isValid: .constant(true), textfieldText: $cardOwnerText)
                    
                    CustomTextFieldWithBackgroundView(fieldTitle: .constant("Card Number"), isValid: .constant(true), textfieldText: $cardNumberText)
                    
                    HStack(spacing: 20) {
                        CustomTextFieldWithBackgroundView(fieldTitle: .constant("EXP"), isValid: .constant(true), textfieldText: $cardExpText)
                        
                        CustomTextFieldWithBackgroundView(fieldTitle: .constant("CVV"), isValid: .constant(true), textfieldText: $cardCVVText)
                    }
                }
                .padding(.horizontal, 20)
            }
            .scrollIndicators(.hidden)
            .contentMargins(.top, 30)
            
            Spacer()
            
            Button(action: {
            }, label: {
                Text("Add Card")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: 20)
            })
            .modifier(AppButtonBackground())
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    AddNewCardView()
}
