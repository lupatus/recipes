//
//  RecipesTests.swift
//  RecipesTests
//
//  Created by Michal Kluszewski on 10/17/24.
//
import Foundation
import Testing
@testable import Recipes

struct RecipeServiceTests {
    @Test func fetchesRecipes() async throws {
        let mockData = try! Data(contentsOf: Bundle.main.url(forResource: "recipes.json", withExtension: nil)!)
        let service = RecipeService(data: mockData)
        let recipes = try await service.fetchRecipes()
        #expect(recipes.count > 0, "Parses correcly list of recipes")
    }
    
    @Test func errorsOutCorrectly() async throws {
        let mockData = try! Data(contentsOf: Bundle.main.url(forResource: "recipes-malformed.json", withExtension: nil)!)
        let service = RecipeService(data: mockData)
        await #expect(throws: RecipeServiceError.self, "Throws error for malformed data") {
            try await service.fetchRecipes()
        }
    }
    
    @Test func errorsOutForEmptyList() async throws {
        let mockData = try! Data(contentsOf: Bundle.main.url(forResource: "recipes-empty.json", withExtension: nil)!)
        let service = RecipeService(data: mockData)
        await #expect(throws: RecipeServiceError.self, "Throws error for empty list") {
            try await service.fetchRecipes()
        }
    }

}
