//
//  Config.swift
//  Recipes
//
//  Created by Michal Kluszewski on 10/17/24.
//
import Foundation


enum Config {
    /// Config error
    enum Error: Swift.Error {
        case missingKey, invalidValue
    }
    
    /// Get a value from main bundle
    ///
    /// - Parameters:
    ///     - for: name of the parameter
    ///
    /// - Returns: requested value from main bundle with proper type
    /// 
    /// - Throws: error if key is missing in main bundle or cannot be casted to requested type
    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey:key) else {
            throw Error.missingKey
        }

        switch object {
        case let value as T:
            return value
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            throw Error.invalidValue
        }
    }
}
