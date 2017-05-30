//
//  NetworkCall.swift
//  weatherBuild
//
//  Created by Marathon on 5/26/17.
//  Copyright © 2017 Marathon. All rights reserved.
//

import Foundation


class NetworkCall {
    
    var weatherResponse = Dictionary<String, AnyObject>()
    
    let weatherURL = "http://api.openweathermap.org/data/2.5/weather?q="
    let apiKey     = "7b61f99ff9408f37b1db091d9ed1b3ac"
    
    
//    func networkCallMainFunction(cityNameFromView: String) -> Dictionary<String, AnyObject> {
//        
//        self.getWeather(cityName: cityNameFromView, completion: {
//            String in
//            return self.weatherResponse
//        })
//        return self.weatherResponse
//    }
// 
    
    func getWeather(cityName: String,completion: @escaping(Any) -> Void) {
        
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self as? URLSessionDelegate, delegateQueue: nil )
        let weatherCompleteURL = "\(weatherURL)\(cityName)&APPID=\(apiKey)"
        let urlName = URL.init(string: weatherCompleteURL)
        var urlRequest = URLRequest.init(url: urlName!)
        urlRequest.httpMethod = "GET"
        
        let datatask = session.dataTask(with: urlRequest, completionHandler: {(data, response, error) -> Void in
            
            if let json = data {
//                let dataStr = String(data: json, encoding: String.Encoding.utf8) as String!
//                print("\n\(String(describing: dataStr))")
                
                do {
                    self.weatherResponse = try JSONSerialization.jsonObject(with: json, options: []) as! [String: AnyObject]
                    print(self.weatherResponse)
                    print("Temperature: \(self.weatherResponse["main"]!["temp"]!!)")
                    completion(self.weatherResponse)
                }
                catch let jsonError as NSError {
                    print("JSON error description: \(jsonError.description)")
                }
            }
            else {
                print(String(describing: error?.localizedDescription))
            }
        })
        datatask.resume()
    }
}
