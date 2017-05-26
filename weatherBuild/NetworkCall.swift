//
//  NetworkCall.swift
//  weatherBuild
//
//  Created by Marathon on 5/26/17.
//  Copyright © 2017 Marathon. All rights reserved.
//

import Foundation


class NetworkCall {
    
    let weatherURL = "http://api.openweathermap.org/data/2.5/weather?q="
    let apiKey     = "7b61f99ff9408f37b1db091d9ed1b3ac"
    
    func getWeather(cityName: String) {
        
        let session = URLSession.shared
        let weatherCompleteURL = "\(weatherURL)\(cityName)&APPID=\(apiKey)"
        let urlName = URL.init(string: weatherCompleteURL)
        let urlRequest = URLRequest.init(url: urlName!)
        
        let datatask = session.dataTask(with: urlRequest, completionHandler: {(data, response, error) -> Void in
            
            if let json = data {
                let dataStr = String(data: json, encoding: String.Encoding.utf8) as String!
                print("\n\(String(describing: dataStr))")
            }
            else {
                print(String(describing: error?.localizedDescription))
            }
        })
        datatask.resume()
        
    }
}
