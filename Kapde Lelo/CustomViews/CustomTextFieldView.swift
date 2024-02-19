//
//  SwiftUIView.swift
//  Kapde Lelo
//
//  Created by Aman Raghuvanshi on 12/02/24.
//

import SwiftUI

struct CustomTextFieldView: View {
    @Binding var fieldTitle: String
    @Binding var isValid: Bool
    @Binding var textfieldText: String
    
    var body: some View {
        VStack {
            HStack {
                Text(fieldTitle)
                    .font(.custom(SF_PRO_TEXT_REGULAR, size: 13))
                    .foregroundStyle(.gray)
                Spacer()
            }
            
            TextField("", text: $textfieldText)
                .font(.custom(SF_PRO_TEXT_MEDIUM, size: 20))
                .frame(height: 50)
            
            VStack {}
                .frame(height: 0.5)
                .frame(maxWidth: .infinity)
                .background(.gray)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    CustomTextFieldView(fieldTitle: .constant("username"), isValid: .constant(false), textfieldText: .constant(""))
}
