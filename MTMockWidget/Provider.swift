//
//  Provider.swift
//  MTMockWidgetExtension
//
//  Created by Santiago Mendoza on 18/11/21.
//

import WidgetKit

struct Provider: TimelineProvider {
    typealias Entry = OrderEntry

    func placeholder(in context: Context) -> OrderEntry {
        OrderEntry.mockOrderEntry()
    }

    func getSnapshot(in context: Context, completion: @escaping (OrderEntry) -> ()) {
        let entry = OrderEntry.mockOrderEntry()
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {

        OrderManager.shared.getOrders{ (response) in
            if(response != nil && response?.result != nil)
            {
                let currentDate = Date()
                let entry = OrderEntry(date: currentDate, order: (response?.result)!)
                let refreshDate = Calendar.current.date(byAdding: .second, value: 2, to: currentDate)!
                let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
                completion(timeline)
            }
        }

    }
}
