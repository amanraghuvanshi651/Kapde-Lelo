//
//  PaymentStatusView.swift
//  Kapde Lelo
//
//  Created by Aman Raghuvanshi on 19/02/24.
//

import SwiftUI

struct PaymentStatusView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var appState: ApplicationState
    
    @State var count = 3
    @State var animationCompleted = false
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image("Back")
                        .resizable()
                        .frame(width: 50, height: 50)
                })
                Spacer()
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
            Image("\(count)", bundle: nil)
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 20)
            
            if animationCompleted {
                Text("Order Confirmed!")
                    .font(.custom(SF_PRO_TEXT_HEAVY, size: 30))
                    .padding(.horizontal, 20)
                
                Text("Your order has been confirmed, we will send you confirmation email shortly.")
                    .font(.custom(SF_PRO_TEXT_REGULAR, size: 15))
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
            }
            
            Spacer()
            Spacer()
            
            Button(action: {
                appState.setAppState(state: .tabView)
            }, label: {
                Text("Continue Shopping")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: 20)
            })
            .modifier(AppButtonBackground())
        }
        .navigationBarBackButtonHidden(true)
        .onAppear(perform: {
            Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { timer in
                if count == 60 {
                    withAnimation {
                        animationCompleted = true
                    }
                }
                if count >= 92 {
                    timer.invalidate()
                } else {
                    count += 1
                }
            }
        })
    }
}

#Preview {
    PaymentStatusView()
}
