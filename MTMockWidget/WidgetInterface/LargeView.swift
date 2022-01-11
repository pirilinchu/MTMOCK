//
//  LargeView.swift
//  MTMockWidgetExtension
//
//  Created by Santiago Mendoza on 18/11/21.
//

import SwiftUI
import WidgetKit

struct LargeView: View {

    private var orders: [Order]

    init(_orders: [Order]) {
        self.orders = _orders
    }

    var body: some View {

        VStack(alignment:.leading, spacing:2) {

            ForEach(orders, id: \.id){ order in
            Text(order.customerName)
                .font(Font.subheadline)
                .foregroundColor(Color.purple).lineLimit(1)

            Text("\(stringWithTimeNoYear(date: order.callDate)) (\(order.status.rawValue))").font(.footnote)
                .foregroundColor(Color.secondary).lineLimit(1)
            HStack {
                VStack(alignment: .leading, spacing: 1) {
                    Field(_title: "Call type", _description: order.callType)
                    Field(_title: "Customer address", _description: "\(order.address), \(order.state)")
                }
                VStack(alignment: .leading, spacing: 1) {
                    Field(_title: "Call #", _description: order.callNumberCode)
                    Field(_title: "Make/Model", _description: "\(order.model)")
                }
                
            }
            }
        }.padding(10)

    }

    
    private func stringWithTimeNoYear(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: Locale.current.identifier)
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMdhm")
        return dateFormatter.string(from: date)
    }
}


struct LargeView_Previews: PreviewProvider {
    static var previews: some View {
        LargeView(_orders: [Order(id: "12345", address: "Address", callDate: Date(), callNumberCode: "SCXXX", callType: "Type", customerName: "Customer Name", model: "Model", state: "State", statusCode: "D", statusCodeCode: "D"),Order(id: "4567", address: "Address", callDate: Date(), callNumberCode: "SCXXX", callType: "Type", customerName: "Customer Name", model: "Model", state: "State", statusCode: "D", statusCodeCode: "D")]).previewContext(WidgetPreviewContext(family: .systemLarge))
        
    }
}
