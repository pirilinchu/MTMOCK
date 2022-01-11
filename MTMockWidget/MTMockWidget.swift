//
//  MTMockWidget.swift
//  MTMockWidget
//
//  Created by Santiago Mendoza on 18/11/21.
//

import WidgetKit
import SwiftUI

struct MTMockWidgetEntryView : View {
    var entry: Provider.Entry

    @Environment(\.widgetFamily) var family

    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            SmallView(_order: entry.order.first!)

        case .systemMedium:
            MediumView(_order: entry.order.first!)
        
        case .systemLarge:
            LargeView(_orders: entry.order)

        default:
            fatalError()

        }
    }
}

@main
struct MTMockWidget: Widget {
    let kind: String = "MTMockWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            MTMockWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("MobileTech Widget")
        .description("This is an Example Widget for MobileTech")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct MyTravelWidget_Previews: PreviewProvider {
    static var previews: some View {
        MTMockWidgetEntryView(entry: OrderEntry.mockOrderEntry())
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
