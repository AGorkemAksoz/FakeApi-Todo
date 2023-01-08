//
//  ToDo.swift
//  FakeApı
//
//  Created by Ali Görkem Aksöz on 5.01.2023.
//

import Foundation

// MARK: - ToDo
struct ToDo: Codable {
    let userID, id: Int?
    let title: String?
    let completed: Bool?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
}


