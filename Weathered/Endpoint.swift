//
//  Endpoint.swift
//  Weathered
//
//  Created by aB on 4/6/23.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var baseURL: String { get }
    var path: String { get }
    var parameters: [URLQueryItem] { get }
    var method: String { get }
}
