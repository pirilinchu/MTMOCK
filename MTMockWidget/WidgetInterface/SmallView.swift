//
//  SmallView.swift
//  MTMockWidgetExtension
//
//  Created by Santiago Mendoza on 18/11/21.
//

import SwiftUI
import WidgetKit

struct SmallView: View {

    private var order: Order

    init(_order: Order) {
        self.order = _order
    }

    var body: some View {
        VStack(alignment:.leading, spacing:2) {

            Text(order.customerName)
                .font(Font.subheadline)
                .foregroundColor(Color.purple).lineLimit(1)

            Text("\(stringWithTimeNoYear(date: order.callDate)) (\(order.status.rawValue))").font(.footnote)
                .foregroundColor(Color.secondary).lineLimit(1)

  
                Field(_title: "Call type", _description: order.callType)
                Field(_title: "Customer address", _description: "\(order.address), \(order.state)")
        }.padding(8)
    }

    
    private func stringWithTimeNoYear(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: Locale.current.identifier)
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMdhm")
        return dateFormatter.string(from: date)
    }
}


struct Field: View {
    private var title: String
    private var description: String
    
    init (_title: String, _description: String) {
        title = _title
        description = _description
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 1) {
            Text(title).font(.subheadline).foregroundColor(Color.gray).lineLimit(1)
            Text(description).font(.subheadline).tint(Color.black).lineLimit(1)
        }
    }
    
}

struct SmallView_Previews: PreviewProvider {
    static var previews: some View {

            SmallView(_order: Order(id: "12345", address: "Address", callDate: Date(), callNumberCode: "SCXXX", callType: "Type", customerName: "Customer Name", model: "Model", state: "State", statusCode: "D", statusCodeCode: "D"))
                .previewContext(WidgetPreviewContext(family: .systemSmall))

    }
}
