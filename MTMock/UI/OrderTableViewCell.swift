//
//  OrderTableViewCell.swift
//  MTMock
//
//  Created by Santiago Mendoza on 18/11/21.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    static let reuseID = "OrderTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var callTypeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var callNumberLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var separatorHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Set the separator height to 1px
        let scale = UIScreen.main.scale
        separatorHeight.constant = 1.0 / scale
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configured(with order: Order) -> Self {
        titleLabel.text = order.customerName

        var topText = "\(stringWithTimeNoYear(date: order.callDate)) (\(order.status))"


        dateLabel.text = topText
        callTypeLabel.text = order.callType
        addressLabel.text = "\(order.address), \(order.state)"
        callNumberLabel.text = order.callNumberCode
        modelLabel.text = "\(order.model)"

        return self
    }
    
    private func stringWithTimeNoYear(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: Locale.current.identifier)
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMdhm")
        return dateFormatter.string(from: date)
    }
    
}
