//
//  weatherwidget.swift
//  weatherwidget
//
//  Created by Qussk_MAC on 2020/12/01.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
      
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent

}

struct weatherwidgetEntryView : View {

    var entry: Provider.Entry
  @Environment(\.widgetFamily) var family

    var body: some View {
      
      switch family {
      case .systemSmall :
        Text(entry.date, style: .time).foregroundColor(.white)
            .fontWeight(.light)
          //  .kerning(3)
          .padding(.leading, 10)
          .padding(.trailing, 10)
          .padding(.top, 40)
          .padding(.bottom, -70)
            .font(.custom("AppleGothic", size: 30))
            .background(Image("fall06")
                          .resizable()
                          .scaledToFill()
                          .frame(width: 180, height: 100, alignment: .center)
                       )
          
      case .systemMedium:
        Text(entry.date, style: .time).foregroundColor(.white)
            .fontWeight(.light)
         // .kerning(3)
          .padding(.leading, 110)
          .padding(.trailing, 8)
          .padding(.top, 30)
          .padding(.bottom, -70)
            .font(.custom("AppleGothic", size: 40))
            .background(Image("fall04")
                          .resizable()
                          .scaledToFill()
                          .frame(width: 350, height: 300, alignment: .center)
                       )
        
      case .systemLarge:
      Text(entry.date, style: .time).foregroundColor(.white)
          .fontWeight(.light)
       // .kerning(0)
        .padding(.leading, 120)
        .padding(.trailing, 30)
        .padding(.top, 200)
        .padding(.bottom, -70)
          .font(.custom("AppleGothic", size: 40))
          .background(Image("fall08")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 500, height: 500, alignment: .center))

     default:
        Text("doing")
      }
    }
}

@main
struct weatherwidget: Widget {
    let kind: String = "weatherwidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            weatherwidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct weatherwidget_Previews: PreviewProvider {
  
  static var previews: some View {
    Group {
      weatherwidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
        .previewContext(WidgetPreviewContext(family: .systemSmall))
      
      weatherwidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
        .previewContext(WidgetPreviewContext(family: .systemMedium))
      
      weatherwidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
        .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
    }
  
  

}
