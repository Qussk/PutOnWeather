//
//  TimeLineProvider.swift
//  weatherwidgetExtension
//
//  Created by Qussk_MAC on 2020/12/04.
//

import Foundation
import WidgetKit

struct WeatherTimeLineProviders: TimelineProvider {
  func getTimeline(in context: Context, completion: @escaping (Timeline<TotalcaseEntry>) -> Void) {
  }
  
  typealias Entry = TotalcaseEntry

  let service = Endpoint.shared
  

  func placeholder(in context: Context) -> TotalcaseEntry {
    TotalcaseEntry.placeholder
  }
  
  func getSnapshot(in context: Context, completion: @escaping (TotalcaseEntry) -> Void) {
    if context.isPreview {
      completion(TotalcaseEntry.placeholder)
    }else{
    //  fetchTotalcaseState(){
    }
    }
  private func fetchTotalcaseState(completion: @escaping (Result<TotalcaseEntry, Error>) -> Void) {
   // service.fetchWeatherForecast<T> { (result) in
  //    switch result {
      
//      }
//    }
 }
  
    
}
