//
//  WeatherViewConteroller.swift
//  weatherPutOn
//
//  Created by Qussk_MAC on 2020/10/16.
//

import UIKit

final class WeatherViewController: UIViewController {
  
  var forecastService: ForecastServiceable!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    forecastService.fetchWeatherForecast(endpoint: .init(path: .weather)) { result in
      switch result {
      case .success(let value): print(value)
      case .failure(let error): print("현재 날씨 가져오기 실패. \(error)")
      }
    }
    
  }
}


/*
final class WeatherViewController : UIViewController{
  
    /*
     forecastService.fetchWeatherForecast(endpoint: .init(path: .weather)) { result in
     switch result {
     //success의 값이 let weather로 들어오고 이를 프린트함
     case .success(let weather) : print(weather)
     case .failure(let error) : print(error) //여기서 error는 decodingError
     }
     }
     */
    var forecastService: ForecastServiceable!
    
    override func viewDidLoad() {
      super.viewDidLoad()
print("Ddd")
      forecastService.fetchWeatherForecast(endpoint: .init(path: .weather)) { result in
        switch result {
        case .success(let value): print(value)
        case .failure(let error): print("현재 날씨 가져오기 실패. \(error)")
        //지금은 확인하는 용이기 때문에 print하고, 나중에 사용할 때는 직접 데이터를 저장하는 방식으로 해야함.
        }
      }
      
    }
  }

*/

