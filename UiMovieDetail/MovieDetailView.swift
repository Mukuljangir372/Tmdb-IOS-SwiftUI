//
//  MovieDetailView.swift
//  Tmdb
//
//  Created by Mukul Jangir on 09/06/22.
//

import SwiftUI


struct MovieDetailView: View {
    
    let movie: NetworkMovie
    
    var body: some View {
        List {
            VStack {
                LoadingImage(url: movie.posterUrl,
                             width: .infinity,
                             height:350,
                             radius: 8,
                             overlayIcon: "play.circle.fill"
                )
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 1, trailing: 0))
                
                Text("\(movie.titleText)")
                    .font(.system(size: 30,weight: .semibold))
                    .lineLimit(3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                Text("\(movie.releaseDateText)")
                    .font(.body)
                    .foregroundColor(.black.opacity(0.7))
                    .frame(maxWidth: .infinity, alignment: .leading)

                RatingView(rating: .constant(movie.rating))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 1, leading: 0, bottom: 1, trailing: 0))
                   
                Text("\(movie.overviewText)")
                    .font(.body)
                    .foregroundColor(.black.opacity(0.6))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
            }
            .navigationBarTitle("", displayMode: .inline)
            .toolbar(content: {
                ToolbarItem(placement: .principal){
                    VStack {
                        Text("\(movie.titleText)")
                    }
                }
            })
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: NetworkMovie.previewData[0])
    }
}
