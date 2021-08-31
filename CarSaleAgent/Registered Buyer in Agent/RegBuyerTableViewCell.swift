//
//  RegBuyerTableViewCell.swift
//  CarSaleAgent
//
//  Created by Apple on 12/07/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class RegBuyerTableViewCell: UITableViewCell {

    @IBOutlet weak var lblbname: UILabel!
    @IBOutlet weak var lblregstatus: UILabel!
    @IBOutlet weak var lblcity: UILabel!
    @IBOutlet weak var lblrefer: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
