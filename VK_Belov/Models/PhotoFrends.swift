//
//  PhotoFrends.swift
//  VK_Belov
//
//  Created by Алексей Белов on 29.04.2021.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation
import RealmSwift

// MARK: - Welcome
class PhotoFrends: Codable {
    let response: ResponsePhotoFrends
}

// MARK: - Response
class ResponsePhotoFrends: Codable {
    let count: Int
    let items: [ItemPhotoFrends]
}

// MARK: - Item
class ItemPhotoFrends: Codable {
    let albumID, date, id, ownerID: Int
    let hasTags: Bool
    let sizes: [SizePhotoFrends]
    let text: String
    let lat, long: Double?

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case date, id
        case ownerID = "owner_id"
        case hasTags = "has_tags"
        case sizes, text, lat, long
    }
    
    init(albumID: Int, date: Int, id: Int, ownerID: Int, hasTags: Bool, sizes: [SizePhotoFrends], text: String, lat: Double , long: Double) {
            self.albumID = albumID
            self.date = date
            self.id = id
            self.ownerID = ownerID
            self.hasTags = hasTags
            self.sizes = sizes
            self.text = text
            self.lat = lat
            self.long = long
        }
    
}

// MARK: - Size
class SizePhotoFrends: Codable {
    let height: Int
    let url: String
    let type: String
    let width: Int
    
    init(height: Int, url: String, type: String, width: Int){
        self.height = height
        self.url = url
        self.type = type
        self.width = width
    }
}


class ItemPhotoFrendsRealm: Object, Codable{
    
    @objc dynamic var   albumID: Int = 0
    @objc dynamic var   date: Int = 0
    @objc dynamic var   id: Int = 0
    @objc dynamic var   ownerID: Int = 0
    @objc dynamic var   hasTags: Bool = false
    dynamic var   sizes = List<SizePhotoFrendsRealm>()
    @objc dynamic var   text: String = ""
    @objc dynamic var   lat: Double = 0.0
    @objc dynamic var  long: Double = 0.0
    
}

// MARK: - SizePhotiRealm
class SizePhotoFrendsRealm: Object, Codable {
    @objc dynamic var height: Int = 0
    @objc dynamic var url: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var width: Int = 0
}
