//
//  ForecastServiceStub.swift
//  weatherPutOn
//
//  Created by Qussk_MAC on 2020/10/16.
//

import Foundation
// ForecastServiceStub : 샘플 데이터를 이용한 디코딩 테스트용 클래스


//2개의 클래스 - 모두 동일한 함수를 구현하도록 강제
//api와 로컬데이터 클래스랑 다름.
//그래서 실제데이터를 쓰거나, 로컬데이터에 따라 바꿀 수 있도록.
//ForecastServiceStub이름 하나로만 쓸 수 있도록(공통)
final class ForecastServiceStub: ForecastServiceable {
  func fetchWeatherForecast<T>( //<T> 어떤 타입이든 올 수 있다.
    endpoint: Endpoint,
    completionHandler: @escaping (Result<T, ServiceError>) -> Void
  ) where T: Decodable {
    let data: Data
    switch endpoint.path {
    case .weather :
      data = SampleData.currentWeather
    case .forecast :
      data = SampleData.forecast
    }
    
    do {
      let weather = try JSONDecoder().decode(T.self, from: data)
      completionHandler(.success(weather))
    } catch {
      completionHandler(.failure(.decodingError(error)))//성공했을 때, weather데이터 들어감.
    }
  }
}

