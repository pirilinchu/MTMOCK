//
//  Order.swift
//  MTMock
//
//  Created by Santiago Mendoza on 18/11/21.
//

import Foundation

struct Order : Decodable{

    enum Status: String {
        // Add necessary cases here as required.
        case pending        = "P"
        case dispatched     = "D"
        case scheduled      = "S"
        case onHold         = "H"
        case canceled       = "X"
        case okToInvoice    = "OKB"
        case unknown

        var code: String { rawValue }

        var name: String {
            switch self {
            case .pending:      return "Pending"
            case .dispatched:   return "Dispatched"
            case .scheduled:    return "Scheduled"
            case .onHold:       return "On Hold"
            case .canceled:     return "Canceled"
            case .okToInvoice:  return "OK to Invoice"
            case .unknown:      return "Unknown"
            }
        }
    }

    var id = " "

    var address = " "
    var callDate = Date()
    var callNumberCode = " "
    var callType = " "
    var customerName = " "
    var model = " "
    var state = " "
    var statusCode = " "
    var statusCodeCode = " "


    var modelDisplayText: String {
        let modelDisplayText = model.trimmingCharacters(in: .whitespaces)
        return modelDisplayText.isEmpty ? "UNKNOWN MODEL" : modelDisplayText
    }

    var status: Status {
        Status(rawValue: statusCodeCode) ?? .unknown
    }

//    convenience init(parameters: [String: Any]) {
//        self.init(parameters: parameters, executeSync: false)
//    }
//
//    convenience init(parameters: [String: Any], executeSync: Bool = false) {
//        self.init()
//
//        id = parameters["Id"] as? String ?? id
//        address = parameters["Address"] as? String ?? address
//        callNumberCode = parameters["CallNumber_Code"] as? String ?? callNumberCode
//        callType = parameters["CallType"] as? String ?? callType
//        customerName = parameters["CustomerName"] as? String ?? customerName
//        model = parameters["Model"] as? String ?? model
//        state = parameters["State"] as? String ?? state
//        statusCode = parameters["StatusCode"] as? String ?? statusCode
//        statusCodeCode = (parameters["StatusCode_Code"] as? String)?.trimmingCharacters(in: .whitespaces) ?? statusCodeCode
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS ZZZZ"
//
//        callDate = (parameters["CallDate"] as? String).flatMap(dateFormatter.date(from:)) ?? callDate
//    }
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"

        case address = "Address"
        case callNumberCode = "CallNumber_Code"
        case callType = "CallType"
        case customerName = "CustomerName"
        case model = "Model"
        case state = "State"
        case statusCode = "StatusCode"
        case statusCodeCode = "StatusCode_Code"
        }
}

struct OrderResponse : Decodable
{
    let result: [Order]?
}

