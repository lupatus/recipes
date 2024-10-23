//
//  Settings.swift
//  Recipes
//
//  Created by Michal Kluszewski on 10/17/24.
//
import Foundation

enum Settings {
    /// The URL where the data lays
    static var dataURL: URL {
        return try! URL(string: Config.value(for: "DataURL"))!
    }
}
