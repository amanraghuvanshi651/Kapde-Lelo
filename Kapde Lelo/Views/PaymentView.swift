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
                
                Text("Add Review")
                    .font(.custom(SF_PRO_TEXT_BOLD, size: 17))
                    .foregroundStyle(.black)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 25)
            
            ScrollView {
//                HStack(spacing: -230) {
                    ForEach(0 ..< 10) {
                        i in
                        Color.blue
                            .frame(width: 250, height: 200)
                            .clipShape(.rect(cornerRadius: 20))
                            .padding(.horizontal)
                            .scrollTransition { view, phase in
                                view.opacity(phase.value > 0 ? 0 : 1.0)
                                    .offset(x: phase == .topLeading ? -200 : phase == .identity ? 0 : 200)
//                                    .blur(radius: phase.value > 0 ? 15 : 0)
//                                    .rotationEffect(.degrees(phase.value > 0 ? -90 : 0))
                            }
//                    }
                }
                .frame(height: 500)
                .scrollTargetLayout()
                
//                Section {
//                    ScrollView {
//                        LazyHStack {
//                            ForEach(1 ..< 3) { i in
//                                Image("card\(i)")
//                                    .resizable()
//                                    .padding(.horizontal, 20)
//                                    .aspectRatio(1.8, contentMode: .fill)
//                                    .shadow(color: .black.opacity(0.2),radius: 5)
//                                    .scrollTransition { view, phase in
//                                        view.opacity(phase.value > 0 ? 0 : 1.0)
//                                    }
//                            }
//                        }
//                    }
//                }
            }
            .scrollTargetBehavior(.paging)
        }
        
    }
    
    func getOffset(for phase: ScrollTransitionPhase) -> Double {
        switch phase {
        case .topLeading:
            -200
        case .identity:
            0
        case .bottomTrailing:
            200
        }
    }
}

#Preview {
    PaymentView()
}
