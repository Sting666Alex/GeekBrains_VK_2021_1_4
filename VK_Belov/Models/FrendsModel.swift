//
//  UserModel.swift
//  VK_Belov
//
//  Created by Алексей Белов on 21.04.2021.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation
import RealmSwift

// MARK: - Welcome
class FrendsElement: Codable {
    let response: ResponseFrends
    init(response: ResponseFrends) {
            self.response = response
        }
}

// MARK: - ResponseFrends
class ResponseFrends: Codable {
    let count: Int
    let items: [ItemFrends]

    init(count: Int, items: [ItemFrends]) {
            self.count = count
            self.items = items
        }
}

// MARK: - ItemFrends
class ItemFrends: Codable {
    let name: String
    let id: Int
    let surname: String
    let canAccessClosed: Bool
    let isClosed: Bool
    //let lists: [Int]?
    let trackCode: String
    let urlFoto: String? 
    
    enum CodingKeys: String, CodingKey {
            case name = "first_name"
            case id
            case surname = "last_name"
            case canAccessClosed = "can_access_closed"
            case urlFoto = "photo_50"
            case isClosed = "is_closed"
            //case lists
            case trackCode = "track_code"
    }
    
    init(firstName: String, id: Int, lastName: String, canAccessClosed: Bool, isClosed: Bool, photo50: String, trackCode: String) {
            self.name = firstName
            self.id = id
            self.surname = lastName
            self.canAccessClosed = canAccessClosed
            self.isClosed = isClosed
            self.urlFoto = photo50
            //self.lists = lists
            self.trackCode = trackCode
        }
}

class ItemFrendsRealm: Object{
    
    @objc dynamic var name: String = ""
    @objc dynamic var id: Int = 0
    @objc dynamic var surname: String = ""
    @objc dynamic var canAccessClosed: Bool = false
    @objc dynamic var isClosed: Bool = false
//    @objc dynamic var lists: [Int] = []
    @objc dynamic var trackCode: String = ""
    @objc dynamic var urlFoto: String? = ""
    
//    enum CodingKeys: String, CodingKey {
//        case name = "first_name"
//        case id
//        case surname = "last_name"
//        case canAccessClosed = "can_access_closed"
//        case urlFoto = "photo_50"
//        case isClosed = "is_closed"
//        //case lists
//        case trackCode = "track_code"
//    }
}
