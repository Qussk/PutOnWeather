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
    didSet {
      rootView.tableView.alpha = 0
      //화면오른쪽으로 가게 만든 다음, 데이타 위치를 원래 위치로 돌아오도록
      rootView.tableView.transform = CGAffineTransform(translationX: .screenWidth, y: 0)
      
      UIView.animate(withDuration: 0.3, animations: {
        self.rootView.tableView.alpha = 1
        self.rootView.tableView.transform = .identity
        self.rootView.tableView.reloadSections([0], with: .none)
      })
    }
  }
  
  private var forecastList: [Weather]? {
    didSet { rootView.tableView.reloadSections([1], with: .none) }
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
  func configureViews() {
    // 버튼 누를 때마다 이미지 변경
    rootView.reloadButton.addTarget(self, action: #selector(updateWeather(_:)), for: .touchUpInside)
 
    rootView.tableView.register(CurrentWeatherCell.self, forCellReuseIdentifier: CurrentWeatherCell.identifier)
    rootView.tableView.register(ForecastCell.self, forCellReuseIdentifier: ForecastCell.identifier)
    rootView.tableView.dataSource = self
    rootView.tableView.delegate = self
  }
  
  //스테이터스바 히든시킴
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

// MARK: - UITableViewDataSource

extension WeatherViewController: UITableViewDataSource {
  private enum Section: Int, CaseIterable {
    case currentWeather, forecast
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
  //  print("Section.allCases:", Section.allCases)
    return Section.allCases.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Section.currentWeather.rawValue == section
      ? (currentWeather == nil ? 0 : 1)
      : (forecastList?.count ?? 0)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if Section.currentWeather.rawValue == indexPath.section {
      let cell = tableView.dequeueReusableCell(
        withIdentifier: CurrentWeatherCell.identifier, for: indexPath
        ) as! CurrentWeatherCell
      
      guard let current = currentWeather, let sky = current.sky.first else { return cell }
      
      let minTemp = limitFraction(of: current.main.temp_min, maximum: 1)
      let maxTemp = limitFraction(of: current.main.temp_max, maximum: 1)
      let temp = limitFraction(of: current.main.temp, maximum: 1)
      cell.configure(
        weatherImageName: sky.icon,
        weatherStatus: sky.description,
        minTemp: minTemp,
        maxTemp: maxTemp,
        currentTemp: temp
      )
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(
        withIdentifier: ForecastCell.identifier, for: indexPath
        ) as! ForecastCell
      
      guard let forecast = forecastList?[indexPath.row], let sky = forecast.sky.first else { return cell }

      let day = dateFormatter.string(from: forecast.date, type: .day)
      let time = dateFormatter.string(from: forecast.date, type: .time)
      let temp = limitFraction(of: forecast.main.temp, maximum: 0)
      cell.configure(date: day, time: time, imageName: sky.icon, temperature: temp)
      return cell
    }
  }
  
  private func limitFraction(of temperature: Double, maximum: Int) -> String {
    return String(format: "%.\(maximum)f°", temperature)
  }
}


// MARK: - UITableViewDelegate

extension WeatherViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return (Section.forecast.rawValue == indexPath.section) ? 80 : tableView.rowHeight
  }
}
