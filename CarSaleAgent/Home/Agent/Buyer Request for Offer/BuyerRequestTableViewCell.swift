//
//  BuyerRequestTableViewCell.swift
//  CarSaleAgent
//
//  Created by Apple on 20/06/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

protocol CellDelegate2:class {
    func Cellbtntapped(tag:Int)
}

class BuyerRequestTableViewCell: UITableViewCell {
    weak var delegate2:CellDelegate2?
    @IBOutlet weak var btnnext: UIButton!
    
    @IBOutlet weak var txtoffer: UITextField!
    @IBOutlet weak var lblbuyername: UILabel!
    @IBOutlet weak var lblcarname: UILabel!
    @IBOutlet weak var imgv: UIImageView!
    @IBOutlet weak var lblcity: UILabel!
    @IBOutlet weak var offerview: UIView!
    
    @IBOutlet weak var view: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.imgv.layer.masksToBounds = true
        self.imgv.layer.cornerRadius = self.imgv.layer.frame.size.width / 2.1
        
        self.imgv.clipsToBounds = true
        
        view.layer.borderWidth = 1.5
        view.layer.shadowOffset = CGSize(width: -1, height: 1)
    }

    override func layoutSubviews() {
        //
        btnnext.isHidden = true
    }

    
    //
    //btnaction
    @IBAction func btntap(_ sender: UIButton) {
        delegate2?.Cellbtntapped(tag: sender.tag)
    }
    
}
