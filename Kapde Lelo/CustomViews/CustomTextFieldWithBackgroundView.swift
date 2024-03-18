//
//  CustomTextFieldWithBackgroundView.swift
//  Kapde Lelo
//
//  Created by macmini50 on 27/02/24.
//

import SwiftUI

struct CustomTextFieldWithBackgroundView: View {
    @Binding var fieldTitle: String
    @Binding var isValid: Bool
    @Binding var textfieldText: String
    var height = 50.0
    
    var body: some View {
        VStack {
            HStack {
                Text(fieldTitle)
                    .font(.custom(SF_PRO_TEXT_BOLD, size: 17))
                    .foregroundStyle(.black)
                Spacer()
            }
            
            VStack {
                if height <= 50 {
                    TextField("", text: $textfieldText)
                        .font(.custom(SF_PRO_TEXT_MEDIUM, size: 20))
                        .padding(.horizontal, 10)
                } else {
                    TextEditor(text: $textfieldText)
                        .scrollContentBackground(.hidden)
                        .font(.custom(SF_PRO_TEXT_MEDIUM, size: 20))
                        .clipShape(.rect(cornerRadius: 10))
                        .padding(.horizontal, 10)
                }
            }
            .frame(height: height)
            .background(Color(BACKGROUND_HIGHLIGHT_COLOR, bundle: nil))
            .clipShape(.rect(cornerRadius: 10))
        }
    }
}

#Preview {
    CustomTextFieldWithBackgroundView(fieldTitle: .constant("username"), isValid: .constant(false), textfieldText: .constant(""))
}
