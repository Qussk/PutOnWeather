//
//  WeatherViewConteroller.swift
//  weatherPutOn
//
//  Created by Qussk_MAC on 2020/10/16.
//

import UIKit

final class WeatherViewController : UIViewController{
  
  var forecastService : ForecastServiceable!
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .yellow
    
    /*
    forecastService.fetchWeatherForecast(endpoint: .init(path: .weather)) { result in
      switch result {
      //success의 값이 let weather로 들어오고 이를 프린트함
      case .success(let weather) : print(weather)
      case .failure(let error) : print(error) //여기서 error는 decodingError
      }
    }
    */
    
    forecastService.fetchWeatherForecast(endpoint: .init(path: .weather)) { result in
      switch result {
      case .success(let value): print(value)
      case .failure(let error) : print("현재날씨 가져오기 실패")
      }
    }
    }
    
  }
  
