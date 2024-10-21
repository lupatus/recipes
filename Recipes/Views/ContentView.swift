//
//  ContentView.swift
//  Recipes
//
//  Created by Michal Kluszewski on 10/17/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = RecipeViewModel()
        
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                    } else {
                        List(viewModel.recipes) { recipe in
                            /*NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                                RecipeRowView(recipe: recipe)
                            }*/
                            RecipeRowView(recipe: recipe)
                        }
                    }
                }
            }
            .navigationTitle("Recipes")
            .onAppear {
                viewModel.loadRecipes()
            }
        }
    }
}

#Preview {
    ContentView()
}
