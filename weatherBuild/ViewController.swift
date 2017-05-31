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
    @IBOutlet var cityTextField: UITextField!
    
    
    
    var checkTempFandC = "F"
    var tempFahrenheit = Double()
    let weather = NetworkCall();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let tapLbl = UITapGestureRecognizer(target: lblTempetaureDisplay, action: <#T##Selector?#>)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleLblTap(sender:)))
//        tap.numberOfTapsRequired = 1
//        tap.delegate = self as? UIGestureRecognizerDelegate
        lblTempetaureDisplay.addGestureRecognizer(tap)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleLblTap(sender: UITapGestureRecognizer) {
        if checkTempFandC == "F" {
            tempFahrenheit = (tempFahrenheit - 32) * 0.5556
            self.lblTempetaureDisplay.text = String(format: "%.1f", tempFahrenheit)
            self.lblCorF.text = "°C"
            checkTempFandC = "C"
        } else {
            tempFahrenheit = (tempFahrenheit * 1.8) + 32
            self.lblTempetaureDisplay.text = String(format: "%.1f", tempFahrenheit)
            self.lblCorF.text = "°F"
            checkTempFandC = "F"
        }
    }
    
    
    @IBAction func getWeatherBtnAction(_ sender: UIButton) {
        
        if let cityNameTxtField = self.cityTextField.text {
            
            weather.getWeather(cityName: cityNameTxtField){ (response) in
                
                var weatherDict = response as! Dictionary <String, AnyObject>
                //    print("Temperature: \(weatherDict["main"]!["temp"]!!)")
                let tempFahrenheitStrAny  = (weatherDict["main"]!["temp"]!!)
                var tempFahrenheitStr = tempFahrenheitStrAny as! Double
                tempFahrenheitStr = Double(round(10*tempFahrenheitStr)/10)
                self.tempFahrenheit = tempFahrenheitStr
                
                DispatchQueue.main.async {
                    self.lblTempetaureDisplay.text = tempFahrenheitStr.description
                    self.lblCorF.text = "°F"
                }
            }
        }
    }
}

