//
//  Forecast.swift
//  weatherPutOn
//
//  Created by Qussk_MAC on 2020/10/17.
//

import Foundation

struct Forecast: Decodable {
  let list: [Weather]
}



//이름이 동일해서 코딩키할 필요 없음
