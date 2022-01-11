//
//  OrderManager.swift
//  MTMock
//
//  Created by Santiago Mendoza on 18/11/21.
//

import Foundation

protocol OrderManagerProtocol {
    func getOrders(completionHandler: @escaping(_ result: OrderResponse?)-> Void)
}

struct OrderManager: OrderManagerProtocol{
    
    static var shared = OrderManager()
    
    func getOrders(completionHandler: @escaping (OrderResponse?) -> Void) {
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://run.mocky.io/v3/e7ee2c08-ec93-451d-9f16-9148a192a271")!)) { (responseData, urlResponse, serverError) in

            if(serverError == nil)
            {
                do {
                    let result = try JSONDecoder().decode(OrderResponse.self, from: responseData!)
                    completionHandler(result)
                } catch  {
                    debugPrint(error)
                }
            }
        }.resume()
    }


}
