//
//  Recipe.swift
//  Recipes
//
//  Created by Michal Kluszewski on 10/17/24.
//
import Foundation

struct Recipe: Codable, Identifiable {
    var id: UUID { uuid }
    let uuid: UUID
    let cuisine: String
    let name: String
    let photoUrlLarge: URL?
    let photoUrlSmall: URL?
    let sourceUrl: URL?
    let youtubeUrl: URL?
    
    enum CodingKeys: String, CodingKey {
        case uuid
        case cuisine
        case name
        case photoUrlLarge = "photo_url_large"
        case photoUrlSmall = "photo_url_small"
        case sourceUrl = "source_url"
        case youtubeUrl = "youtube_url"
    }
}
