//
//  ViewController.swift
//  weatherBuild
//
//  Created by Marathon on 5/26/17.
//  Copyright © 2017 Marathon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblTempetaureDisplay: UILabel!
    @IBOutlet var lblCorF: UILabel!
    @IBOutlet var imgViewIconDisplay: UIImageView!
    
    
    
    var checkTempFandC = "F"
    var tempFahrenheit = Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weather = NetworkCall();
       
        weather.getWeather(cityName: "Hyd"){ (response) in
            
            var weatherDict = response as! Dictionary <String, AnyObject>
            print("Temperature: \(weatherDict["main"]!["temp"]!!)")
            let tempFahrenheitStr  = (weatherDict["main"]!["temp"]!!) as! String
            self.tempFahrenheit = Int(tempFahrenheitStr)!
            self.lblTempetaureDisplay.text = String(describing: self.tempFahrenheit)
            }
        
//        var weatherDict = weather.networkCallMainFunction(cityNameFromView: "Vizag")
        
        _ = UITapGestureRecognizer(target: lblTempetaureDisplay, action: #selector(handleLblTap))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleLblTap(sender: UITapGestureRecognizer) {
        if checkTempFandC == "F" {
            self.lblTempetaureDisplay.text = String((Double(tempFahrenheit) - 32) * 0.5556)
            tempFahrenheit = Int((Double(tempFahrenheit) - 32) * 0.5556)
            self.lblCorF.text = "°C"
            checkTempFandC = "C"
        } else {
            self.lblTempetaureDisplay.text = String((Double(tempFahrenheit) * 1.8) + 32)
            tempFahrenheit = Int((Double(tempFahrenheit) * 1.8) + 32)
            self.lblCorF.text = "°F"
            checkTempFandC = "F"
        }
    }

    @IBOutlet var btnGetCurrentWeather: UIButton!

}

