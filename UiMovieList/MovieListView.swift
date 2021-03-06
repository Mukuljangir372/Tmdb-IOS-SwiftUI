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
            NavigationLink(destination: MovieDetailView(movie: movie)){}
            HStack() {
                LoadingImage(url: movie.posterUrl, width: 90, height: 90, radius: 10)
                VStack(alignment: .leading){
                    Text("\(movie.titleText)")
                        .font(.headline)
                    Text("\(movie.overviewText)")
                        .lineLimit(3)
                        .font(.body)
                }
                Spacer()
            }
        }
    }
}
struct MovieListView: View {
    
    @StateObject private var viewModel = MovieListState()
    
    var body: some View {
        NavigationView {
            switch viewModel.movieNetworkResult {
            case .loading:
                ProgressView()
            case .failure(let error):
                Text("\(error.localizedDescription)")
            case .success(let movies):
                List(movies.results,id: \.id){ movie in
                    MovieView(movie: movie)
                        .listRowInsets(
                            EdgeInsets.init(top: 10, leading: 18, bottom: 10, trailing: 10)
                        )
                }
                .refreshable{
                    loadMovies()
                }
                .listStyle(.plain)
                .navigationTitle("Movies")
            default:
                ProgressView()
            }
        }.onAppear(perform: loadMovies)
    }
    
    private func loadMovies() {
        Task{
            await viewModel.getMovies()
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
