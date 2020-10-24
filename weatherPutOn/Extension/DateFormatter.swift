//
//  DateFormatter.swift
//  weatherPutOn
//
//  Created by Qussk_MAC on 2020/10/24.
//

import Foundation

extension DateFormatter {
  enum DateType {
    case currentTime, day, time
  }
  
  func string(from date: Date, type: DateType) -> String {
    switch type {
    case .currentTime: dateFormat = "a h:mm"
    case .day: dateFormat = "M.d (E)"
    case .time: dateFormat = "HH:mm"
    }
    return string(from: date)
  }
}
