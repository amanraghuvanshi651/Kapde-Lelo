//
//  AddAddressView.swift
//  Kapde Lelo
//
//  Created by macmini50 on 27/02/24.
//

import SwiftUI

struct AddAddressView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var appState: ApplicationState
    
    @State var isPrimaryAddress = false
    
    @State var isUsernameTextValid = false
    @State var isCountryTextValid = false
    @State var isCityTextValid = false
    @State var isPhoneNumberTextValid = false
    @State var isAddressTextValid = false
    
    @State var usernameText = ""
    @State var countryText = ""
    @State var cityText = ""
    @State var phoneNumberText = ""
    @State var addressText = ""
    
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
                
                Text("Address")
                    .font(.custom(SF_PRO_TEXT_BOLD, size: 17))
                    .foregroundStyle(.black)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 25)
            
            VStack(spacing: 20) {
                CustomTextFieldWithBackgroundView(fieldTitle: .constant("Name"), isValid: $isUsernameTextValid, textfieldText: $usernameText)
                
                HStack(spacing: 15) {
                    CustomTextFieldWithBackgroundView(fieldTitle: .constant("Country"), isValid: $isCountryTextValid, textfieldText: $countryText)
                    
                    CustomTextFieldWithBackgroundView(fieldTitle: .constant("Country"), isValid: $isCityTextValid, textfieldText: $cityText)
                }
                
                CustomTextFieldWithBackgroundView(fieldTitle: .constant("Phone Number"), isValid: $isPhoneNumberTextValid, textfieldText: $phoneNumberText)
                
                CustomTextFieldWithBackgroundView(fieldTitle: .constant("Address"), isValid: $isAddressTextValid, textfieldText: $addressText)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            
            Toggle("Save as primary address", isOn: $isPrimaryAddress)
                .font(.custom(SF_PRO_TEXT_REGULAR, size: 15))
                .foregroundStyle(.black)
                .padding(.horizontal, 20)
            
            Spacer()
            
            Button(action: {
            }, label: {
                Text("Save Address")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: 20)
            })
            .modifier(AppButtonBackground())
        }
    }
}

#Preview {
    AddAddressView()
}
