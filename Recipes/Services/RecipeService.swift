//
//  RecipeService.swift
//  Recipes
//
//  Created by Michal Kluszewski on 10/17/24.
//

import Foundation

/// Service for fetching and maintainance of ``Recipe`` data
///
/// Typical usage of the service:
/// ```swift
/// let service = RecipeService.shared
/// do {
///     let recipes = try await service.fetchRecipes()
/// } catch {
///     print("There was an error loading recipes: \(error.localizedDescription)")
/// }
/// ```
///
/// For preview purposes one can fed the service with ready data:
/// ```swift
/// let mockData = try! Data(contentsOf: Bundle.main.url(forResource: "response.json", withExtension: nil)!)
/// let service = RecipeService(data: mockData)
/// do {
///     // get `mockData` parsed and processed into `[Recipe]`
///     let recipes = try await service.fetchRecipes()
/// } catch {
///     print("There was an error loading recipes: \(error.localizedDescription)")
/// }
/// ```
///
/// For testing URLSession can be replaced with mock session
/// ```swift
/// let service = RecipeService(session: mockSession)
/// ```
class RecipeService {
    /// Static data - for preview/test purposes
    private var data: Data? = nil
    
    /// URLSession - useful for testing
    private var session: URLSession? = nil
    
    /// Current data load task
    private var task: Task<[Recipe], Error>? = nil
    
    /// Recently loaded recipes list
    private var recipes: [Recipe]? = nil
    
    /// Error if recent list loading failed
    private var error: Error? = nil
    
    /// Shared instance of the service
    ///
    /// Will hold to the data to decrease unwanted network calls while views and view-models are reloaded
    static let shared = RecipeService()
    
    convenience init() {
        self.init(data: nil, session: nil)
    }
    
    /// Initializer for preview/test purposes
    ///
    /// - Parameters:
    ///    - data: JSON string as a ``Data`` instance
    convenience init(data: Data) {
        self.init(data: data, session: nil)
    }
    
    /// Initializer for testing purposes
    ///
    /// - Parameters:
    ///    - session: URLSession replacement
    convenience init(session: URLSession) {
        self.init(data: nil, session: session)
    }
    
    private init(data: Data? = nil, session: URLSession? = nil) {
        self.data = data
        self.session = session
    }
    
    /// Fetches the data from data URL or returns static data if instance was initialized with it
    ///
    ///  - Parameters:
    ///     - completion: closure receiving results or error of data load
    private func fetchData(completion: @escaping(Data?, URLResponse?, Error?) -> Void) {
        if let data = self.data {
            completion(data, nil, nil)
            return;
        }
        let session = self.session ?? URLSession.shared
        session.dataTask(with: Settings.dataURL, completionHandler: completion).resume()
    }
    
    /// Fetch and process the data
    ///
    /// It gets the data from `fetchData` and decodes it to ``Recipe`` list
    ///
    /// - Returns: list of ``Recipe`` models
    ///
    /// - Throws: `RecipeServiceError` whether there is a problem loading recipes
    private func fetchRecipesData() async throws -> [Recipe] {
        return try await withCheckedThrowingContinuation { continuation in
            DispatchQueue.global(qos: .background).async {
                self.fetchData() { data, response, error in
                    if let error = error {
                        DispatchQueue.main.async {
                            continuation.resume(throwing: RecipeServiceError.requestError(error))
                        }
                        return
                    }
                    guard let data = data else {
                        DispatchQueue.main.async {
                            continuation.resume(throwing: RecipeServiceError.noData)
                        }
                        return
                    }
                    
                    do {
                        let decoder = JSONDecoder()
                        let container = try decoder.decode(ResponseData.self, from: data)
                        DispatchQueue.main.async {
                            if container.recipes.count > 0 {
                                continuation.resume(returning: container.recipes)
                            } else {
                                continuation.resume(throwing: RecipeServiceError.noRecipes)
                            }
                        }
                    } catch {
                        DispatchQueue.main.async {
                            print("\(error)")
                            continuation.resume(throwing: RecipeServiceError.decodingError(error))
                        }
                    }
                }
            }
        }
    }
    
    /// Fetches recipes data
    ///
    /// This method makes sure the data is not double loaded
    /// It is also not making new requests if data was already loaded, unless `force` parameter is true
    ///
    /// - Parameters:
    ///     - force: forces the method to reload the data (unless the request is already running and not finished)\
    ///
    /// - Returns: list of `Recipe` items
    ///
    /// - Throws: `RecipeServiceError` whether there is a problem with loading recipe data
    func fetchRecipes(_ force: Bool = false) async throws -> [Recipe] {
        if let t = task {
            return try await t.value;
        }
        if force {
            recipes = nil
            error = nil
        }
        if let r = recipes {
            return r
        }
        if let e = error {
            throw e
        }
        let newTask = Task {
            defer {
                task = nil
            }
            do {
                let recipes = try await fetchRecipesData()
                self.recipes = recipes
                return recipes
            } catch {
                self.error = error
                throw error
            }
        }
        task = newTask
        return try await newTask.value
    }
    
}
