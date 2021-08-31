//
//  agentListsTableViewCell.swift
//  CarSaleAgent
//
//  Created by Apple on 23/05/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class agentListsTableViewCell: UITableViewCell {


    @IBOutlet weak var vname: UILabel!
    @IBOutlet weak var imgagent: UIImageView!
    @IBOutlet weak var lblprice: UILabel!
    @IBOutlet weak var lblmake: UILabel!
    @IBOutlet weak var lblyear: UILabel!
    @IBOutlet weak var lblstatus: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        self.imgagent.layer.cornerRadius = self.imgagent.layer.frame.size.height / 2.3
        
        self.imgagent.clipsToBounds = true
        imgagent.layer.borderWidth = 1.0
        imgagent.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
    }

}
