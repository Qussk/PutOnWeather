//
//  Weather.swift
//  weatherPutOn
//
//  Created by Qussk_MAC on 2020/10/16.
//

import Foundation

struct Weather {
  let main: Main
  let sky: [Sky]
  let date: Date
  
  struct Main: Decodable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
  }
  
  //sampleData의 weather값과 동일
  struct Sky: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
  }
}

//MARK: - Decodable
extension Weather: Decodable {
  private enum CodingKeys: String, CodingKey {
    //sampleData에서 필요한 3가지 데이터 파싱
    case weather, main, dt
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    sky = try container.decode([Sky].self, forKey: .weather)//weather라는 key이용해서 [Sky]라는 배열타입을 꺼내서 sky에 할당.
    main = try container.decode(Main.self, forKey: .main)
    let timestamp = try container.decode(TimeInterval.self, forKey: .dt)
    date = Date(timeIntervalSince1970: timestamp)
    
    //date가 아닌 TimeInterval로 꺼내 온 후, dete에 할당.
  }
}

//내가 원하는 데이터만 보기 쉽게 구성
//MARK: -CustomStringConvertible
extension Weather : CustomStringConvertible {
  var description: String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM.dd HH시"
    var description = "[ \(formatter.string(from: date)) ]"
    description += " ☀️ \(sky.first!.main) (\(sky.first!.description)), "
    //main이랑 description부분만 출력하고 온도만 따로
    description += " 🌡 \(main.temp)º"
    return "\n" + description
    //예시 [02.02 02시] ☀️ clouds(튼 구름),🌡 22.95º
  }
}

