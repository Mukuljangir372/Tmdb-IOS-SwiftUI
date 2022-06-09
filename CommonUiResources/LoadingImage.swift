//
//  LoadingImage.swift
//  Tmdb
//
//  Created by Mukul Jangir on 05/06/22.
//

import SwiftUI

struct LoadingImage: View {
    
    let url: URL?
    let width: CGFloat?
    let height: CGFloat
    let radius: CGFloat?
    var overlayIcon: String? = ""
    
    var body: some View {
        AsyncImage(url: url,content: view).frame(width: width, height: height)
    }
    
    @ViewBuilder
    private func view(for phase: AsyncImagePhase) -> some View {
        switch phase {
        case .empty:
            ProgressView()
        case .failure(_):
            VStack(alignment: .leading){
                Image(systemName: "photo")
                    .foregroundColor(.gray)
            }
        case .success(let image):
            image
            .resizable()
            .scaledToFill()
            .frame(width: width, height: height)
            .cornerRadius(radius!)
            .clipped()
            .overlay(content: {
                Image(systemName: overlayIcon ?? "")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
            })
        default:
            Text("failed to load image")
                .foregroundColor(.blue)
        }
    }
}


