//
//  Repository.swift
//  CombineCall
//
//  Created by Bharat Lal on 25/03/23.
//

import Foundation

struct Repository: Codable {
    let id: Int
    let name: String
    let fullName: String
    let description: String?
    let isPrivate: Bool
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case isPrivate = "private"
        case description
    }
}
