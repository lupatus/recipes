//
//  RecipeViewModel.swift
//  Recipes
//
//  Created by Michal Kluszewski on 10/17/24.
//
import Foundation
import Combine

/// View-Model for Recipes
///
/// Uses ``RecipeService`` to load the data
@MainActor class RecipeViewModel: ObservableObject {
    /// whenever loading is in progress
    @Published var isLoading: Bool = false
    /// list of the recipes if ready
    @Published var recipes: [Recipe] = []
    /// error if we couldn't load the recipes
    @Published var errorMessage: String? = nil
    
    /// recipes service instance
    private let recipeService: RecipeService
    
    convenience init() {
        self.init(recipeService: RecipeService.shared)
    }
    
    /// Initializer for preview/test purposes
    init(recipeService: RecipeService) {
        self.recipeService = recipeService
    }
    
    /// Requests recipes list from the service and update view-model fields
    ///
    /// - Parameters:
    ///  - force: Force service to refresh data (reload)
    private func requestRecipes(_ force: Bool) async {
        isLoading = true
        recipes = []
        errorMessage = nil
        do {
            recipes = try await recipeService.fetchRecipes(force)
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
    
    /// Load recipes from service
    ///
    /// Updates local fields with data from service
    func loadRecipes() async {
        await requestRecipes(false)
    }
    
    /// Reload recipes from services
    ///
    /// Ask service to reload the data and updates local fields
    func reloadRecipes() async {
        await requestRecipes(true)
    }
}
