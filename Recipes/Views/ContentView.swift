//
//  ContentView.swift
//  Recipes
//
//  Created by Michal Kluszewski on 10/17/24.
//

import SwiftUI
import YouTubePlayerKit

struct ContentView: View {
    @StateObject private var viewModel: RecipeViewModel
    @State private var isPresentedNavigation: Bool = false
    @State private var recipeDetail: RecipeDetail? = nil
    
    init() {
        self.init(viewModel: RecipeViewModel())
    }
    
    /// Initializer for preview/test purposes
    init(viewModel: RecipeViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        let showRecipeDetails = { recipeDetail in
            self.recipeDetail = recipeDetail
            isPresentedNavigation = true
        }
        
        NavigationStack {
            Group {
                ZStack(alignment: .center) {
                    List(viewModel.recipes) { recipe in
                        RecipeRowView(recipe: recipe, showDetails: showRecipeDetails)
                    }
                        .task { await viewModel.loadRecipes() }
                        .refreshable { await viewModel.reloadRecipes() }
                        .navigationDestination(isPresented: $isPresentedNavigation) {
                            if let detail = recipeDetail {
                                switch detail {
                                case .sourceUrl(let url):
                                    RecipeDetailView(url: url)
                                        .navigationBarBackButtonHidden(true)
                                case .youtubeUrl(let url):
                                    VideoView(url: url)
                                        .navigationBarBackButtonHidden(true)
                                }
                            }
                        }
                    if viewModel.isLoading {
                        ProgressView()
                    }
                    
                    if let err = viewModel.errorMessage {
                        Text(err)
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationTitle("Recipes")
        }
    }
}

#Preview("Recipes") {
    let mockData = try! Data(contentsOf: Bundle.main.url(forResource: "recipes.json", withExtension: nil)!)
    ContentView(viewModel: RecipeViewModel(recipeService: RecipeService(data: mockData)))
}

#Preview("Data error") {
    let mockData = try! Data(contentsOf: Bundle.main.url(forResource: "recipes-malformed.json", withExtension: nil)!)
    ContentView(viewModel: RecipeViewModel(recipeService: RecipeService(data: mockData)))
}

#Preview("No Recipes") {
    let mockData = try! Data(contentsOf: Bundle.main.url(forResource: "recipes-empty.json", withExtension: nil)!)
    ContentView(viewModel: RecipeViewModel(recipeService: RecipeService(data: mockData)))
}
