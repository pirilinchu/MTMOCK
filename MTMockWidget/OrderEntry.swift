//
//  OrderEntry.swift
//  MTMock
//
//  Created by Santiago Mendoza on 18/11/21.
//

import WidgetKit

struct OrderEntry: TimelineEntry {
    let date: Date
    let order: [Order]

    static func mockOrderEntry() -> OrderEntry {
        return OrderEntry(date: Date(), order: [Order(id: "12345", address: "Address", callDate: Date(), callNumberCode: "SCXXX", callType: "Type", customerName: "Customer Name", model: "Model", state: "State", statusCode: "D", statusCodeCode: "D")])
    }

}
