//
//  WebServiceController.swift
//  Weathered
//
//  Created by aB on 4/6/23.
//

import Foundation

public enum WebServiceControllerError: Error {
    case invalidURL(String)
    case invalidPayload(URL)
    case forwarded(Error)
}

public protocol WebServiceController {
    func fetchWeatherData(city: String, completionHandler: @escaping (String?, WebServiceControllerError?) -> Void)
}
