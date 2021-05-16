//
//  PhotoAlbums.swift
//  VK_Belov
//
//  Created by Алексей Белов on 29.04.2021.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct PhotoAlbums: Codable {
    let response: ResponsePhotoAlbums
}

// MARK: - Response
struct ResponsePhotoAlbums: Codable {
    let count: Int
    let items: [ItemPhotoAlbums]
}

// MARK: - Item
struct ItemPhotoAlbums: Codable {
    let id, thumbID, ownerID: Int
    let title, itemDescription: String
    let created, updated, size: Int
    let thumbIsLast: Int?
    let privacyView, privacyComment: Privacy

    enum CodingKeys: String, CodingKey {
        case id
        case thumbID = "thumb_id"
        case ownerID = "owner_id"
        case title
        case itemDescription = "description"
        case created, updated, size
        case thumbIsLast = "thumb_is_last"
        case privacyView = "privacy_view"
        case privacyComment = "privacy_comment"
    }
}

// MARK: - Privacy
struct Privacy: Codable {
    let category: String
}
