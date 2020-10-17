//
//  ForecastServiceable.swift
//  weatherPutOn
//
//  Created by Qussk_MAC on 2020/10/16.
//

import Foundation

//이 프로토콜을 채택한 모든 클래스는 이것을 구현하도록..
// 씬딜리게이트 루트뷰를 -> ForecastServiceStub
protocol ForecastServiceable {
  func fetchWeatherForecast(
    endpoint: Endpoint,//어디에 접근할 건지
    //Result이용하여, 성공 - waether타입, 에러 - 서비스에러
    completionHandler: @escaping (Result<Weather, ServiceError>) -> Void
  )
}
