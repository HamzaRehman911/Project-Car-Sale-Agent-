//
//  MenuTableViewCell.swift
//  CarSaleAgent
//
//  Created by Apple on 06/05/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var imgmenu: UIImageView!
    
    @IBOutlet weak var lblmenuname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
