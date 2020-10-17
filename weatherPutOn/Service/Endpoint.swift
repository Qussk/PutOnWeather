//
//  Endpoint.swift
//  weatherPutOn
//
//  Created by Qussk_MAC on 2020/10/16.
//

import Foundation


struct Endpoint {
  let path : Path
}

extension Endpoint {
  enum Path : String {
    case weather
  }
}

/*
struct Endpoint {
  //defaultAppID 데이터 단위
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
    components.path = apiVersion + path.rawValue
    components.queryItems = query.map {
      URLQueryItem(name: $0.rawValue, value: $1)
    }
    components.queryItems?.append(.init(name: "appid", value: appID))
    return components.url
  }
}


extension Endpoint {
  enum Path: String {
    case weather
    case forecast
  }
  enum QueryKey: String {
    case lat, lon, units, cnt, lang
  }
  typealias QueryItems = [QueryKey: String]
}
*/
