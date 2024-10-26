//
//  RecipesTests.swift
//  RecipesTests
//
//  Created by Michal Kluszewski on 10/17/24.
//
import Foundation
import Testing
@testable import Recipes

@Suite(.serialized)
struct RecipesTests {
    @Test func serviceFetchesRecipes() async throws {
        let mockData = try! Data(contentsOf: Bundle.main.url(forResource: "recipes.json", withExtension: nil)!)
        MockURLProtocol.setResponseChain([.data(mockData), .error(500)])
        let service = RecipeService(session: MockURLProtocol.createMockSession())
        let recipes = try await service.fetchRecipes()
        #expect(recipes.count > 0, "Parses correcly list of recipes")
        let recipes2 = try await service.fetchRecipes()
        #expect(recipes.count == recipes2.count, "Second call to fetch recipe returns the same set of recipes, when force wasn't set")
        await #expect(throws: RecipeServiceError.self, "Throws expected error (queued in response chain) when forced to perform request") {
            try await service.fetchRecipes(true)
        }
    }
    
    @Test func serviceHandlesMultiRequest() async throws {
        let mockData = try! Data(contentsOf: Bundle.main.url(forResource: "recipes.json", withExtension: nil)!)
        MockURLProtocol.setResponseChain([.data(mockData), .error(500)])
        let service = RecipeService(session: MockURLProtocol.createMockSession())
        async let recipes1 = try service.fetchRecipes()
        async let recipes2 = try service.fetchRecipes()
        async let recipes3 = try service.fetchRecipes()
        let recipes = try await [recipes1, recipes2, recipes3]
        #expect(recipes[0].count > 0, "Parses correcly list of recipes")
        #expect(recipes[0].count == recipes[1].count, "All requests got same result")
        #expect(recipes[0].count == recipes[2].count, "All requests got same result")
    }
    
    @Test func serviceErrorsOutCorrectly() async throws {
        let mockData = try! Data(contentsOf: Bundle.main.url(forResource: "recipes-malformed.json", withExtension: nil)!)
        MockURLProtocol.setResponse(.data(mockData))
        let service = RecipeService(session: MockURLProtocol.createMockSession())
        await #expect(throws: RecipeServiceError.self, "Throws error for malformed data") {
            try await service.fetchRecipes()
        }
    }
    
    @Test func serviceErrorsOutForEmptyList() async throws {
        let mockData = try! Data(contentsOf: Bundle.main.url(forResource: "recipes-empty.json", withExtension: nil)!)
        MockURLProtocol.setResponse(.data(mockData))
        let service = RecipeService(session: MockURLProtocol.createMockSession())
        await #expect(throws: RecipeServiceError.self, "Throws error for empty list") {
            try await service.fetchRecipes()
        }
    }
    
    @MainActor @Test func viewModelRecivesRecipes() async throws {
        let mockData = try! Data(contentsOf: Bundle.main.url(forResource: "recipes.json", withExtension: nil)!)
        MockURLProtocol.setResponseChain([.data(mockData), .error(500)])
        let service = RecipeService(session: MockURLProtocol.createMockSession())
        let viewModel = RecipeViewModel(recipeService: service)
        await viewModel.loadRecipes()
        #expect(viewModel.recipes.count > 0, "Loads recipes correctly")
        #expect(viewModel.errorMessage == nil, "Error empty on correct load")
        await viewModel.loadRecipes()
        #expect(viewModel.recipes.count > 0, "No unnecessary reload")
        await viewModel.reloadRecipes()
        #expect(viewModel.recipes.count == 0, "Errors out after reload")
        #expect(viewModel.errorMessage != nil, "Contains error explanation")
    }
}
