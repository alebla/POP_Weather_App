//
//  OpenWeatherMapController.swift
//  Weathered
//
//  Created by aB on 4/6/23.
//

import Foundation

class OpenWeatherMapController: WebServiceController {
    func fetchWeatherData(city: String,
                          completionHandler: @escaping (String?, WebServiceControllerError?) -> Void) {
        
        //let endpoint = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(APIKey.key)"
        let endpoint = "https://api.openweathermap.org/data/2.5/find?q=\(city)&units=imperial&appid=\(API.key)"
        guard let safeURLStr = endpoint.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed),
              let endpointURL = URL(string: safeURLStr) else {
            completionHandler(nil, .invalidURL(endpoint))
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: endpointURL) { (data, response, error) -> Void in
            guard error == nil else {
                completionHandler(nil, .forwarded(error!))
                return
            }
            
            guard let responseData = data else {
                completionHandler(nil, .invalidPayload(endpointURL))
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let weatherList = try decoder.decode(OpenWeatherMapContainer.self, from: responseData)
                guard let weatherInfo = weatherList.list?.first,
                      let weather = weatherInfo.weather.first?.main,
                      let temperature = weatherInfo.main.temp else {
                    completionHandler(nil, .invalidPayload(endpointURL))
                    return
                }
                
                let weatherDescription = "\(weather) \(temperature) *F"
                completionHandler(weatherDescription, nil)
            } catch let error {
                completionHandler(nil, .forwarded(error))
            }
            
            
        }
        
        dataTask.resume()
    }
}
