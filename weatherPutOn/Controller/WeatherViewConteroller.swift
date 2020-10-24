//
//  WeatherViewConteroller.swift
//  weatherPutOn
//
//  Created by Qussk_MAC on 2020/10/16.
//
import CoreLocation
import UIKit

final class WeatherViewController: UIViewController {
  
  var forecastService: ForecastServiceable!
  let cityName = "서울"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //현재날씨 : weather에 대한 디코딩테스트
    forecastService.fetchWeatherForecast(endpoint: .init(path: .weather)) {
      (result: Result<Weather, ServiceError> )in//result : (type)T에 대한 흰트주기.
      switch result {
      case .success(let value): print(value)
      case .failure(let error): print("현재 날씨 가져오기 실패. \(error)")
      }
    }
    
    //예보 : forecast에 대한 디코딩테스트
    forecastService.fetchWeatherForecast(endpoint: .init(path: .forecast)) {
      (result: Result<Forecast, ServiceError>) in
      switch result {
      case .success(let value): print(value)
      case .failure(let error): print("기상 예보 가져오기 실패. \(error)")
        //섭씨온도는 -273.15를 하면 나옴
      //지금은 확인하는 용이기 때문에 print하고, 나중에 사용할 때는 직접 데이터를 저장하는 방식으로 해야함.
      }
    }
   
    //서로다른 타입을 받기위해 쓰는 것 - 제네릭
    //Forcast타입을 쓰기위해 ForecastServiceable에서 Weather 을 T로 정의
    
    
    let geocoder = CLGeocoder()
    geocoder.geocodeAddressString(cityName) { (placemark, error) in
      guard error == nil else {return print(error!.localizedDescription)}//에러가 없으면 아래코드 실행
      guard let location = placemark?.first?.location else { return print("데이터가 없습니다.")}
      print(location.coordinate.latitude)
      print(location.coordinate.longitude)
    }
  }
}
