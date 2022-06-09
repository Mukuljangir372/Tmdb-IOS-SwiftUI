//
//  RatingView.swift
//  Tmdb
//
//  Created by Mukul Jangir on 09/06/22.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int
    
    var label = ""
    var maxRating: Int = 5
    
    var onImage: Image = Image(systemName: "star.fill")
    
    var onColor = Color.yellow
    var offColor = Color.gray
    
    var body: some View {
        HStack{
            if label.isEmpty == false {
                Text(label)
            }
            ForEach(1..<maxRating+1,id: \.self) { number in
                    onImage
                    .foregroundColor(
                        number > rating ? offColor : onColor
                    )
            }
        }
    }

}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4))
    }
}
