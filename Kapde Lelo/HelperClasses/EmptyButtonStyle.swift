//
//  EmptyButtonStyle.swift
//  Kapde Lelo
//
//  Created by macmini50 on 27/02/24.
//

import SwiftUI

struct EmptyButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
    }
}
