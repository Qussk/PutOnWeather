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
  func fetchWeatherForecast<T>(
    endpoint: Endpoint,
    completionHandler: @escaping (Result<T, ServiceError>) -> Void
  ) where T: Decodable
}

/*protocol ForecastServiceable {
  func fetchWeatherForecast<T>(
    endpoint: Endpoint,//어디에 접근할 건지
    //Result이용하여, 성공 - waether타입, 에러 - 서비스에러
    completionHandler: @escaping (Result<T, ServiceError>) -> Void
  ) where T: Decodable
  //T의 자리가 Weather면, weather로 Forecast면, forecast로
}
*/

/*
 completionHandler: @escaping (Result<Weather, ServiceError>) -> Void
 으로부터 변경.
 
 where을 통해 T타입에 대한 흰트 : 적어도 디코더블이라는프로토콜을 가지고 있다 -> 컴파일러에게 알려줌
 
 단순히 T만 전달하는 것이 아니라, where을 통해 쓸 수 있는 범위 넓힘

 //where를 쓰게 되면 아래 함수를 이용해 T를 이용한 다양한 함수사용 가능
 func asdf<T>(any: T) where T : Numeric {
 }

 */


