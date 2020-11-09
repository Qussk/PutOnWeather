//
//  Endpoint.swift
//  weatherPutOn
//
//  Created by Qussk_MAC on 2020/10/16.
//

import Foundation


//url에 https:오픈웨더맵.org/data/2.5/weather?q=asdfafsd~ 어쩌구..를
//요청하는 도착지점을 Endpoint로 정의함.
struct Endpoint {
  static let defaultAppID = "f70d6c9f2bb7e54606403f82eaddf912"
  
  let baseURL = "https://api.openweathermap.org"
  let apiVersion = "/data/2.5/"
  let path: Path
  let query: QueryItems
  let appID: String
  
  init(path: Path, query: QueryItems, appID: String = Endpoint.defaultAppID) {
    self.path = path
    self.query = query
    self.appID = appID
  }
  
  func combineURL() -> URL? {
    guard var components = URLComponents(string: baseURL) else { fatalError() }
    components.path = apiVersion + path.rawValue //path넣기
   // print("components.path : ",components.path)
    components.queryItems = query.map {
      URLQueryItem(name: $0.rawValue, value: $1)
    }
   // print("components.queryItems : ",components.queryItems)
    components.queryItems?.append(.init(name: "appid", value: appID))
    print(components.url?.absoluteString ?? "")
    return components.url
  }
}

//열거형으로 정의
extension Endpoint {
  enum Path: String {
    case weather
    case forecast
  }
  enum QueryKey: String {
    case lat, lon, units, cnt, lang
  }
  typealias QueryItems = [QueryKey: String] //딕셔너리로 만듦
}


