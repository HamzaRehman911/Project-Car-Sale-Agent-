
//
//  agentVehiclesDetailinProfileCollectionViewCell.swift
//  CarSaleAgent
//
//  Created by Apple on 01/07/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class agentVehiclesDetailinProfileCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblprice: UILabel!
    @IBOutlet weak var lblstatus: UILabel!
    @IBOutlet weak var vmodel: UILabel!
    @IBOutlet weak var vmake: UILabel!
    @IBOutlet weak var vname: UILabel!
    @IBOutlet weak var vimg: UIImageView!
    @IBOutlet weak var lblmakelabel: UILabel!
    
    override func layoutSubviews() {
       // vimg.layer.cornerRadius = vimg.layer.frame.height/2
      
    }
    override func awakeFromNib() {
        self.vimg.layer.cornerRadius = self.vimg.layer.frame.size.height / 2.7
        
        self.vimg.clipsToBounds = true
        vimg.layer.borderWidth = 0.5
        vimg.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
