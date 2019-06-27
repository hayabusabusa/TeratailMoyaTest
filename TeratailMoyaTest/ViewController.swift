//
//  ViewController.swift
//  TeratailMoyaTest
//
//  Created by Yamada Shunya on 2019/06/26.
//  Copyright © 2019 Yamada Shunya. All rights reserved.
//

import UIKit
import Moya

class ViewController: UIViewController {

    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let provider = MoyaProvider<LivedoorWeatherAPI>()
        provider.request(.city(CityParam(id: "130010"))) { [weak self] result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let model = try moyaResponse.map(ForecastsModel.self)
                    
                    guard let today = model.forecasts.first else {
                        return
                    }
                    
                    self?.weatherLabel.text = today.telop
                    self?.minTemperatureLabel.text = today.temperature.min?.celsius ?? "不明"
                    self?.maxTemperatureLabel.text = today.temperature.max?.celsius ?? "不明"
                } catch let error {
                    print("json parse失敗")
                    print(error)
                }
            case let .failure(error):
                print("アクセスに失敗しました:\(error)")
                break
            }
        }
    }

}

