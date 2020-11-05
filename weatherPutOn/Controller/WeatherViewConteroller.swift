//
//  WeatherViewConteroller.swift
//  weatherPutOn
//
//  Created by Qussk_MAC on 2020/10/16.
//

import CoreLocation
import UIKit

final class WeatherViewController: UIViewController {
  
  private let rootView = WeatherView()
  
  var forecastService: ForecastServiceable!
  let cityName = "서울"
  
  private var currentWeather: Weather? {
    didSet { print(currentWeather!) }
  }
  private var forecastList: [Weather]? {
    didSet { print(forecastList!) }
  }
  private let dateFormatter = DateFormatter().then {
    $0.locale = Locale(identifier: "ko")
  }
  
  // MARK: Life Cycle
  
  override func loadView() {
    view = rootView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViews()
    geocodeAddressString(city: cityName)
  }
  //누를때마다 이미지 변경
  func configureViews() {
    rootView.reloadButton.addTarget(self, action: #selector(updateWeather(_:)), for: .touchUpInside)
  }
  
  override var prefersStatusBarHidden: Bool { true }
  
  
  // MARK: Action
  //updateWeather 리로드버튼 눌렀을 때 작업
  var count = 0
  @objc private func updateWeather(_ sender: UIButton) {
    geocodeAddressString(city: cityName)
    
    let imageName = ["sunny", "lightning", "cloudy", "rainy"]
    count += 1
    rootView.updateBackgroundImage(imageName: imageName[count % imageName.count])
    
    let spinAnimation = CABasicAnimation(keyPath: "transform.rotation")
    spinAnimation.duration = 0.5
    spinAnimation.toValue = CGFloat.pi * 2
    sender.layer.add(spinAnimation, forKey: "spinAnimation")
  }
  
  
  private func geocodeAddressString(city: String) {
    let geocoder = CLGeocoder()
    geocoder.geocodeAddressString(city) { (placemarks, error) in
      guard error == nil else { return print(error!.localizedDescription) }
      guard let location = placemarks?.first?.location else { return print("데이터가 없습니다.")}
      self.didReceiveLocation(location)
    }
  }
  
  private func didReceiveLocation(_ location: CLLocation) {
    let now = dateFormatter.string(from: Date(), type: .currentTime)
    rootView.updateTopInfoView(location: cityName, time: now)
    
    let latitude = location.coordinate.latitude
    let longitude = location.coordinate.longitude
    fetchCurrentWeather(lat: latitude, lon: longitude)
    fetchForecast(lat: latitude, lon: longitude)
  }
  
  private func fetchCurrentWeather(lat: Double, lon: Double) {
    forecastService.fetchWeatherForecast(endpoint: .init(path: .weather)) {
      (result: Result<Weather, ServiceError>) in
      switch result {
      case .success(let value): self.currentWeather = value
      case .failure(let error): print("현재 날씨 가져오기 실패. \(error)")
      }
    }
  }
  
  private func fetchForecast(lat: Double, lon: Double) {
    forecastService.fetchWeatherForecast(endpoint: .init(path: .forecast)) {
      (result: Result<Forecast, ServiceError>) in
      switch result {
      case .success(let value): self.forecastList = value.list
      case .failure(let error): print("기상 예보 가져오기 실패. \(error)")
      }
    }
  }
}


/*
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
 */

