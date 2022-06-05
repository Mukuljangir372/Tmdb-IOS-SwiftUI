//
//  ContentView.swift
//  Tmdb
//
//  Created by Mukul Jangir on 05/06/22.
//

import SwiftUI

private struct TmdbTabView: View {
    var body: some View {
        TabView{
            MovieListView()
                .tabItem {
                    Label("Movies", systemImage: "star")
                }.tag(0)
            
            SearchMoviesView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }.tag(1)
            
        }.font(.headline)
    }
}
struct ContentView: View {
    var body: some View {
        TmdbTabView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
