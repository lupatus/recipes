//
//  RecipeServiceError.swift
//  Recipes
//
//  Created by Michal Kluszewski on 10/22/24.
//
import Foundation

/// Errors for RecipeService
enum RecipeServiceError: Error {
    case requestError(Error)
    case decodingError(Error)
    case noData
    case noRecipes
}

extension RecipeServiceError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .requestError(_):
            return NSLocalizedString(ErrorStrings.ErrorLoadingRecipes, comment: "")
        case .decodingError(_):
            return NSLocalizedString(ErrorStrings.ErrorLoadingRecipes, comment: "")
        case .noData:
            return NSLocalizedString(ErrorStrings.ErrorLoadingRecipes, comment: "")
        case .noRecipes:
            return NSLocalizedString(ErrorStrings.ErrorEmptyResult, comment: "")
        }
    }
}
