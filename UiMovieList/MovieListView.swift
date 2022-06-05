//
//  MovieListView.swift
//  Tmdb
//
//  Created by Mukul Jangir on 05/06/22.
//

import SwiftUI

struct MovieView: View {
    let movie: NetworkMovie
    
    var body: some View {
        ZStack {
            NavigationLink(destination: SearchMoviesView()){}
            HStack {
                LoadingImage(url: movie.posterUrl, width: 80, height: 80, radius: 10)
                VStack(alignment: .leading){
                    Text("\(movie.titleText)")
                        .font(.headline)
                    Text("\(movie.overviewText)")
                        .lineLimit(3)
                        .font(.body)
                }
            }
        }
    }
}
struct MovieListView: View {
    var body: some View {
        NavigationView {
            List(NetworkMovie.previewData,id: \.id){ movie in
                MovieView(movie: movie)
                    .listRowInsets(
                        EdgeInsets.init(top: 10, leading: 18, bottom: 10, trailing: 10)
                    )
            }
            .refreshable {
                
            }
            .listStyle(.plain)
            .navigationTitle("Movies")
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
