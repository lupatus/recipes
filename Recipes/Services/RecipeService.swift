//
//  RecipeService.swift
//  Recipes
//
//  Created by Michal Kluszewski on 10/17/24.
//

import Foundation

enum RecipeServiceError: Error {
    case requestError(Error)
    case decodingError(Error)
    case noData
}

extension RecipeServiceError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .requestError(_):
            return NSLocalizedString(ErrorStrings.ErrorLoadingRecipes, comment: "")
        case .decodingError(_):
            return NSLocalizedString(ErrorStrings.ErrorLoadingRecipes, comment: "")
        case .noData:
            return NSLocalizedString(ErrorStrings.NoData, comment: "")
        }
    }
}

class RecipeService {
    private func fetchData(completion: @escaping(Data?, URLResponse?, Error?) -> Void) {
#if DEBUG
        if Config.isPreview {
            completion(Config.responseData, nil, nil)
            return;
        }
#endif
        URLSession.shared.dataTask(with: Settings.dataURL, completionHandler: completion).resume()
    }
    
    func fetchRecipes(completion: @escaping (Result<[Recipe], Error>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            self.fetchData() { data, response, error in
                if let error = error {
                    DispatchQueue.main.async {
                        completion(.failure(RecipeServiceError.requestError(error)))
                    }
                    return
                }
                guard let data = data else {
                    DispatchQueue.main.async {
                        completion(.failure(RecipeServiceError.noData))
                    }
                    return
                }

                do {
                    let decoder = JSONDecoder()
                    let container = try decoder.decode(ResponseData.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(container.recipes))
                    }
                } catch {
                    DispatchQueue.main.async {
                        print("\(error)")
                        completion(.failure(RecipeServiceError.decodingError(error)))
                    }
                }
            }
        }
    }
}
