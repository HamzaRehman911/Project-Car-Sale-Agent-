//
//  SearchTableViewCell.swift
//  CarSaleAgent
//
//  Created by Apple on 03/04/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblcellmodel: UILabel!
    @IBOutlet weak var lblcellname: UILabel!
    @IBOutlet weak var lblprice: UILabel!
    
    @IBOutlet weak var lblcellcity: UILabel!
    @IBOutlet weak var imgcell: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        imgcell.layer.cornerRadius = 15
        imgcell.clipsToBounds = true
        // Configure the view for the selected state
    }

}
