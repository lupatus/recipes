//
//  RecipeRowView.swift
//  Recipes
//
//  Created by Michal Kluszewski on 10/17/24.
//
import Foundation
import SwiftUI
import CachedAsyncImage

struct RecipeRowView: View {
    let recipe: Recipe
    let showDetails: (_ recipeDetail: RecipeDetail) -> Void
    
    var body: some View {
        HStack(alignment: .center) {
            if let smallUrl = recipe.photoUrlSmall {
                CachedAsyncImage(url: smallUrl) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                } placeholder: {
                    ProgressView()
                        .frame(width: 50, height: 50)
                }
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.headline)
                Text(recipe.cuisine)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            if let youtubeUrl = recipe.youtubeUrl {
                Button(action: {
                    showDetails(.youtubeUrl(youtubeUrl))
                }) {
                    Image(systemName: "play.circle.fill")
                        .font(.title)
                        .foregroundColor(.red)
                        .buttonStyle(PlainButtonStyle())
                }
                .buttonStyle(PlainButtonStyle())
            }
            
            if let sourceUrl = recipe.sourceUrl {
                Button(action: {
                    showDetails(.sourceUrl(sourceUrl))
                }) {
                    Image(systemName: "safari.fill")
                        .font(.title)
                        .foregroundColor(.blue)
                        .buttonStyle(PlainButtonStyle())
                        .padding(.leading, 8)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 10)
        .buttonStyle(PlainButtonStyle())
    }
    
    private func openYouTubeUrl(url: URL) {
        // pass
    }
    
    private func openDetails(url: URL) {
        // pass
    }
}

#Preview("Full") {
    RecipeRowView(recipe: Recipe(
        uuid: UUID(),
        cuisine: "Malaysian",
        name: "Apam Balik",
        photoUrlLarge: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg")!,
        photoUrlSmall: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg")!,
        //photoUrlSmall: nil,
        sourceUrl: URL(string: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ")!,
        youtubeUrl: URL(string: "https://www.youtube.com/watch?v=6R8ffRRJcrg")!
    )) { _ in
        
    }
}

#Preview("Missing photo") {
    RecipeRowView(recipe: Recipe(
        uuid: UUID(),
        cuisine: "Malaysian",
        name: "Apam Balik",
        photoUrlLarge: nil,
        photoUrlSmall: nil,
        //photoUrlSmall: nil,
        sourceUrl: URL(string: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ")!,
        youtubeUrl: URL(string: "https://www.youtube.com/watch?v=6R8ffRRJcrg")!
    )) { _ in
        
    }
}

