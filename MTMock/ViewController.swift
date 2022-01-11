//
//  ViewController.swift
//  MTMock
//
//  Created by Santiago Mendoza on 18/11/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ordersTableView: UITableView!
    
    var orders: [Order] = []
    
    override func viewDidLoad() {
        ordersTableView.dataSource = self
        super.viewDidLoad()
        registerTableViewCells()
        loadOrders()
    }
    
    private func registerTableViewCells() {
        let nib = UINib(nibName: OrderTableViewCell.reuseID, bundle: nil)
        ordersTableView.register(nib, forCellReuseIdentifier: OrderTableViewCell.reuseID)
    }
    
    private func loadOrders() {
        OrderManager.shared.getOrders { (response) in
            if(response != nil && response?.result != nil)
            {
                self.orders = (response?.result)!
                DispatchQueue.main.async {
                    self.ordersTableView.reloadData()
                }
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    // MARK: UITableViewDelegate

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        orders.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderTableViewCell.reuseID, for: indexPath) as? OrderTableViewCell else {
                fatalError("Unable to Dequeue Service Call Table View Cell")
            }
        return cell.configured(with: orders[indexPath.row])
    }
}

