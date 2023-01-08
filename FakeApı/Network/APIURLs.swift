//
//  APIURLs.swift
//  FakeApı
//
//  Created by Ali Görkem Aksöz on 5.01.2023.
//

import Foundation

enum APIURL {
    
    static func getURL() -> String {
        "https://jsonplaceholder.typicode.com/todos"
    }
    
    static func getDetail(id: Int) -> String? {
        "https://jsonplaceholder.typicode.com/todos/\(id)"
    }
}
