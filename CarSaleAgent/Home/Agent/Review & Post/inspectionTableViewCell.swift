//
//  inspectionTableViewCell.swift
//  CarSaleAgent
//
//  Created by Apple on 04/04/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class inspectionTableViewCell: UITableViewCell {

    @IBOutlet weak var lblview: UILabel!
    
    @IBOutlet weak var roundimgview: UIView!
    @IBOutlet weak var lblinsmodel: UILabel!
    @IBOutlet weak var lblinsname: UILabel!
    
    @IBOutlet weak var imginspection: UIImageView!
    
    
    override func layoutSubviews() {
       self.imginspection.layer.masksToBounds = true
        self.imginspection.layer.cornerRadius = self.imginspection.layer.frame.size.width / 2.0
        
        self.imginspection.clipsToBounds = true
        
//        imginspection.layer.borderWidth = 2
//        imginspection.layer.shadowOffset = CGSize(width: -1, height: 1)
        lblview.layer.borderWidth = 1.5
        lblview.layer.shadowOffset = CGSize(width: -1, height: 1)
       
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
       
        
        
        // Initialization code
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
