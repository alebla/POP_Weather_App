//
//  API.swift
//  Weathered
//
//  Created by aB on 4/6/23.
//

import Foundation

public struct API {
    static let key = "ea5b2a201bee4c1d5de9ea862c4a08d1"
    
}


protocol Endpoint {
    var scheme: String { get }
    var baseURL: String { get }
    var path: String { get }
    var parameters: [URLQueryItem] { get }
    var method: String { get }
}


