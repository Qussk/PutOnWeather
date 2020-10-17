//
//  ForecastService.swift
//  weatherPutOn
//
//  Created by Qussk_MAC on 2020/10/16.
//
/*
import Foundation

final class ForecastService: ForecastServiceable {
  
  private let dispatchGroup = DispatchGroup()
  
  func fetchWeatherForecast<T>(
    endpoint: Endpoint,
    completionHandler: @escaping (Result<T, ServiceError>) -> Void
  ) where T: Decodable {
    guard let url = endpoint.combineURL() else { return completionHandler(.failure(.invalidURL)) }
    
    dispatchGroup.enter() // +2
    URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
      defer { self?.dispatchGroup.leave() }
      guard error == nil else { return completionHandler(.failure(.clientError(error!))) }
      guard let header = response as? HTTPURLResponse,
        (200..<300) ~= header.statusCode
        else { return completionHandler(.failure(.invalidStatusCode)) }
      guard let data = data else { return completionHandler(.failure(.noData)) }
      
      do {
        let weather = try JSONDecoder().decode(T.self, from: data)
        self?.dispatchGroup.notify(queue: .main) {
          completionHandler(.success(weather))
        }
      }
        //main은 항상 async어싱크 //dispatchGroup은 동시에 끝나지 않는 작업을 묶고 있다가, 둘다 끝나야 종료 처리.
        //순서에 영향을 미치기 때문에 서로 연관이 없도록 짜는 것이 좋음.
      
      catch {
        completionHandler(.failure(.decodingError(error)))
      }
    }.resume()
  }
}
*/