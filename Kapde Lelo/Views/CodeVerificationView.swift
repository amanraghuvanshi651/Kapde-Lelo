//
//  CodeVerificationView.swift
//  Kapde Lelo
//
//  Created by Aman Raghuvanshi on 13/02/24.
//

import SwiftUI

enum CodeTag {
    case one
    case two
    case three
    case four
}

struct CodeVerificationView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var tag1 = ""
    @State var tag2 = ""
    @State var tag3 = ""
    @State var tag4 = ""
    @State var isTabViewPresented = false
    
    @FocusState var currentCodeTag: CodeTag?
    
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
            
            Text("Verification Code")
                .font(.custom(SF_PRO_TEXT_HEAVY, size: 28))
            
            Image("Ilus1")
                .resizable()
                .aspectRatio(1.5, contentMode: .fit)
            
            HStack(alignment: .center, spacing: 50) {
                TextField("*", text: $tag1)
                    .multilineTextAlignment(.center)
                    .frame(width: 40, height: 40)
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay( /// apply a rounded border
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black.opacity(0.6), lineWidth: 3)
                    )
                    .onChange(of: tag1) { oldValue, newValue in
                        if tag1.count >= 1 {
                            tag1 = String(tag1.prefix(1))
                            currentCodeTag = .two
                        }
                    }
                    .focused($currentCodeTag, equals: .one)
                    .keyboardType(.numberPad)
                
                TextField("*", text: $tag2)
                    .multilineTextAlignment(.center)
                    .frame(width: 40, height: 40)
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay( /// apply a rounded border
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black.opacity(0.6), lineWidth: 3)
                    )
                    .onChange(of: tag2) { oldValue, newValue in
                        if tag2.count >= 1 {
                            tag2 = String(tag2.prefix(1))
                            currentCodeTag = .three
                        } else {
                            currentCodeTag = .one
                        }
                    }
                    .focused($currentCodeTag, equals: .two)
                    .keyboardType(.numberPad)
                
                TextField("*", text: $tag3)
                    .multilineTextAlignment(.center)
                    .frame(width: 40, height: 40)
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay( /// apply a rounded border
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black.opacity(0.6), lineWidth: 3)
                    )
                    .onChange(of: tag3) { oldValue, newValue in
                        if tag3.count >= 1 {
                            tag3 = String(tag3.prefix(1))
                            currentCodeTag = .four
                        } else {
                            currentCodeTag = .two
                        }
                    }
                    .focused($currentCodeTag, equals: .three)
                    .keyboardType(.numberPad)
                
                TextField("*", text: $tag4)
                    .multilineTextAlignment(.center)
                    .frame(width: 40, height: 40)
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay( /// apply a rounded border
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black.opacity(0.6), lineWidth: 3)
                    )
                    .onChange(of: tag4) { oldValue, newValue in
                        if tag4.count >= 1 {
                            tag4 = String(tag4.prefix(1))
                        } else {
                            currentCodeTag = .three
                        }
                    }
                    .focused($currentCodeTag, equals: .four)
                    .keyboardType(.numberPad)
            }
            
            Spacer()
            
            Text("00:20 resend confirmation code.")
                .foregroundStyle(.gray)
                .font(.custom(SF_PRO_TEXT_REGULAR, size: 15))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .padding(.bottom, 5)
            
            Button(action: {
                isTabViewPresented = true
            }, label: {
                Text("Confirm Code")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: 20)
            })
            .modifier(AppButtonBackground())
            .navigationDestination(isPresented: $isTabViewPresented) {
                KapdeLeloTabView()
            }
        }
        .onAppear(perform: {
            currentCodeTag = .one
        })
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CodeVerificationView()
}
