//
//  searchedVehicleListTableViewCell.swift
//  CarSaleAgent
//
//  Created by Apple on 23/06/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class searchedVehicleListTableViewCell: UITableViewCell {

    @IBOutlet weak var lblcity: UILabel!
    @IBOutlet weak var lblmodel: UILabel!
    @IBOutlet weak var lblprice: UILabel!
    @IBOutlet weak var lblvname: UILabel!
    @IBOutlet weak var vimg: UIImageView!
    @IBOutlet weak var lblagent: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var lblagentOrSeller: UILabel!
    @IBOutlet weak var star: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        vimg.layer.cornerRadius = 15
        vimg.clipsToBounds = true
        
    }

}
