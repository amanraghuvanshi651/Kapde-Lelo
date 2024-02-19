//
//  SideMenuView.swift
//  Kapde Lelo
//
//  Created by Aman Raghuvanshi on 15/02/24.
//

import SwiftUI

struct SideMenuView: View {
    
    @Binding var selectedSideMenuTab: Int
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .fill(.white)
                    .frame(width: 300)
                    .shadow(color: .purple.opacity(0.1), radius: 5, x: 0, y: 3)
                
                VStack(alignment: .leading, spacing: 0) {
                    ProfileImageView()
                        .padding(.bottom, 30)
                    
                    ForEach(SideMenuRowType.allCases, id: \.self){ row in
                        RowView(isSelected: selectedSideMenuTab == row.rawValue, imageName: row.iconName, title: row.title) {
                            selectedSideMenuTab = row.rawValue
                            withAnimation {
                                presentSideMenu.toggle()
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                    
                    Spacer()
                    
                    Button{
                    } label: {
                        VStack(alignment: .leading){
                            HStack(spacing: 10){
                                ZStack{
                                    Image("logout")
                                        .resizable()
                                        .renderingMode(.template)
                                        .foregroundColor(.red)
                                        .frame(width: 26, height: 26)
                                }
                                .frame(width: 30, height: 30)
                                Text("Logout")
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundColor(.red)
                                Spacer()
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                    .frame(height: 50)
                }
                .padding(.top, 80)
                .frame(width: 300)
                .background(
                    Color.white
                )
            }
            .frame(maxHeight: .infinity)
//            Spacer()
            
            Button(action: {
                withAnimation {
                    presentSideMenu.toggle()
                }
            }, label: {
                VStack {
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(.clear)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func ProfileImageView() -> some View{
        HStack(alignment: .center) {
            HStack {
                Image("Male")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 50)
//                            .stroke(.purple.opacity(0.5), lineWidth: 10)
//                    )
                    .cornerRadius(50)
            }
            
            Text("Muhammad Abbas")
                .font(.custom(SF_PRO_TEXT_HEAVY, size: 18))
                .foregroundColor(.black)
            
            Button(action: {}, label: {
                Text("3 Orders")
                    .font(.custom(SF_PRO_TEXT_HEAVY, size: 15))
                    .foregroundStyle(.gray)
                    .padding()
            })
            .background(Color(BACKGROUND_HIGHLIGHT_COLOR, bundle: nil))
            .clipShape(.rect(cornerRadius: 10))
        }
        .padding(.horizontal, 20)
    }
    
    func RowView(isSelected: Bool, imageName: String, title: String, hideDivider: Bool = false, action: @escaping (()->())) -> some View{
        Button{
            action()
        } label: {
            VStack(alignment: .leading){
                HStack(spacing: 10){
                    ZStack{
                        Image(imageName)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.black)
                            .frame(width: 26, height: 26)
                    }
                    .frame(width: 30, height: 30)
                    Text(title)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding(.horizontal, 20)
            }
        }
        .frame(height: 50)
    }
}

#Preview {
    SideMenuView(selectedSideMenuTab: .constant(1), presentSideMenu: .constant(true))
}
