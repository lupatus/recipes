//
//  RecipeViewModel.swift
//  Recipes
//
//  Created by Michal Kluszewski on 10/17/24.
//
import Foundation
import Combine

class RecipeViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var recipes: [Recipe] = []
    @Published var errorMessage: String? = nil
    
    private var recipeService = RecipeService()
    
    func loadRecipes() {
        self.isLoading = true
        recipeService.fetchRecipes { result in
            switch result {
            case .success(let recipes):
                self.recipes = recipes
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
            self.isLoading = false
        }
    }
}
