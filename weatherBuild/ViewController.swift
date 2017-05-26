//
//  ViewController.swift
//  weatherBuild
//
//  Created by Marathon on 5/26/17.
//  Copyright © 2017 Marathon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weather = NetworkCall();
        weather.getWeather(cityName: "Vizag")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

