//
//  menuTableViewCell.swift
//  CarSaleAgent
//
//  Created by Apple on 04/04/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class menuTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblmenuname: UILabel!
    
    
    @IBOutlet weak var imgmenu: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
