//
//  RecipeDetailView.swift
//  Recipes
//
//  Created by Michal Kluszewski on 10/17/24.
//
import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.largeTitle)
                    .padding(.bottom)
            }
            .padding()
        }
        .navigationTitle("Recipe Details")
    }
}
