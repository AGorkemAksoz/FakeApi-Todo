//
//  NetworkHelper.swift
//  FakeApı
//
//  Created by Ali Görkem Aksöz on 5.01.2023.
//

import Foundation

enum HTTPMehtods: String {
    case get = "GET"
    case post = "POST"
}


enum ErrorTypes: String, Error {
    case invalidData = "Invalid data"
    case invalidURL = "Invalid URL"
    case generalError = "An error happened"
}
