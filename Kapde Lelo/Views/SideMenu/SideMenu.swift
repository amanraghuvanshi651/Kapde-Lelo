//
//  SideMenu.swift
//  Kapde Lelo
//
//  Created by macmini50 on 15/02/24.
//

import SwiftUI

struct SideMenu: View {
    @Binding var isShowing: Bool
    var content: AnyView
    var edgeTransition: AnyTransition = .move(edge: .leading)
    var body: some View {
        ZStack(alignment: .bottom) {
            if (isShowing) {
                content
                    .transition(edgeTransition)
                    .background(
                        Color.clear
                    )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
//        .ignoresSafeArea()
        .animation(.easeInOut, value: isShowing)
    }
}

#Preview {
    SideMenu(isShowing: .constant(true), content: AnyView(VStack{}))
}
