//
//  GroupClass.swift
//  VK_Belov
//
//  Created by Алексей Белов on 28.02.2021.

import Foundation
import Alamofire

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)
// MARK: - Welcome
struct GroupElement: Codable {
    let response: ResponseGroup
}

// MARK: - Response
struct ResponseGroup: Codable {
    let count: Int
    let items: [Int]
}
