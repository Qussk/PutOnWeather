//
//  TotalcaseEntry.swift
//  weatherwidgetExtension
//
//  Created by Qussk_MAC on 2020/12/04.
//

import Foundation
import WidgetKit


struct TotalcaseEntry : TimelineEntry{
  var date : Date
  var WeatherWidget : Weather
  var isPlaceholder = false
}


extension TotalcaseEntry {
  
  static var stub : TotalcaseEntry {
    TotalcaseEntry.init(date: Date(), WeatherWidget: .init(main: Weather.Main(temp: 0.0, temp_min: 0.0, temp_max: 0.0), sky: [Weather.Sky(id: 9, main: "Clouds", description: "overcast clouds", icon: "04d")], date: Date()))
  }
  static var placeholder : TotalcaseEntry {
    TotalcaseEntry.init(date: Date(), WeatherWidget: .init(main: Weather.Main(temp: 0.0, temp_min: 0.0, temp_max: 0.0), sky: [Weather.Sky(id: 9, main: "-", description: "overcast clouds", icon: "04d")], date: Date()), isPlaceholder: true)
  }
}

