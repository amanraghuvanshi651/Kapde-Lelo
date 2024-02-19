//
//  AddressView.swift
//  Kapde Lelo
//
//  Created by Aman Raghuvanshi on 19/02/24.
//

import SwiftUI

struct AddressView: View {
    var body: some View {
        HStack(alignment: .top, spacing:15) {
            ZStack {
                Image("location")
                    .resizable()
                    .padding(10)
            }
            .frame(width: 60, height: 60)
            .background(Color(BACKGROUND_HIGHLIGHT_COLOR, bundle: nil))
            .clipShape(.rect(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Chhatak, Sunamgonj 12/8AB Chhatak")
                    .font(.custom(SF_PRO_TEXT_MEDIUM, size: 18))
                    .padding(.top, 5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Home")
                    .font(.custom(SF_PRO_TEXT_MEDIUM, size: 15))
            }
//            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    AddressView()
}
