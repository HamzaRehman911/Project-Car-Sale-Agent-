//
//  AgentRresponseTableViewCell.swift
//  CarSaleAgent
//
//  Created by Apple on 19/06/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class AgentRresponseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var lblagentOrseller: UILabel!
    @IBOutlet weak var vimg: UIImageView!
    @IBOutlet weak var lblpurchase: UILabel!
    @IBOutlet weak var viewResponse: UILabel!
    @IBOutlet weak var AgentName: UILabel!
    @IBOutlet weak var vname: UILabel!
  
    override func layoutSubviews() {
        self.vimg.layer.masksToBounds = true
        self.vimg.layer.cornerRadius = self.vimg.layer.frame.size.width / 2.1
        
        self.vimg.clipsToBounds = true
        
        viewResponse.layer.borderWidth = 1.5
        viewResponse.layer.shadowOffset = CGSize(width: -1, height: 1)
        
        vimg.layer.borderWidth = 1.0
        vimg.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
  

}
