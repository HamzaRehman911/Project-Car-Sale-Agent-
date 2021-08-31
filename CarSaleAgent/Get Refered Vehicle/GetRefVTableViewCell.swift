//
//  GetRefVTableViewCell.swift
//  CarSaleAgent
//
//  Created by Apple on 12/07/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class GetRefVTableViewCell: UITableViewCell {

    @IBOutlet weak var vmg: UIImageView!
    @IBOutlet weak var lblvname: UILabel!
    @IBOutlet weak var lblmake: UILabel!
    @IBOutlet weak var lblprice: UILabel!
   // @IBOutlet weak var lblagntname: UILabel!
    
    @IBOutlet weak var lblagent: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        self.vmg.layer.masksToBounds = true
        self.vmg.layer.cornerRadius = self.vmg.layer.frame.size.width / 2.4
        
        self.vmg.clipsToBounds = true
    }

}
