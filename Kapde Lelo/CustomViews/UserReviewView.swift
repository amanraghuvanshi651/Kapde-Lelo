//
//  UserReviewView.swift
//  Kapde Lelo
//
//  Created by macmini50 on 21/02/24.
//

import SwiftUI

struct UserReviewView: View {
    @Binding var review: ReviewModel
    var dateFormatter = DateFormatter()
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(review.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .background(Color(BACKGROUND_HIGHLIGHT_COLOR, bundle: nil))
                    .clipShape(.circle)
                
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        Text(review.name)
                            .font(.custom(SF_PRO_TEXT_BOLD, size: 20))
                        
                        Spacer()
                        
                        Text("\(review.rating) rating")
                    }
                    
                    HStack(alignment: .center) {
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15)
                        
                        Spacer()
                        
                        Text(dateFormatter.string(from: review.date))
                            .font(.custom(SF_PRO_TEXT_REGULAR, size: 15))
                    }
                }
            }
            
            Text(review.content)
                .font(.custom(SF_PRO_TEXT_REGULAR, size: 15))
                .foregroundStyle(.gray)
        }
        .onAppear(perform: {
            dateFormatter.dateFormat = "d MMM, yyyy"
        })
    }
}

#Preview {
    UserReviewView(review: .constant(ReviewModel(name: "Rolando Wilson", date: Date(), rating: "4.8", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet.", image: "Male")))
}
