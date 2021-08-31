//
//  RequestStatusTableViewCell.swift
//  CarSaleAgent
//
//  Created by Apple on 30/05/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
protocol CellDelegate:class {
    func Cellbtntapped(tag:Int)
}
class RequestStatusTableViewCell: UITableViewCell {

    weak var delegate:CellDelegate?
    
    @IBOutlet weak var vname: UILabel!
    
    @IBOutlet weak var agentname: UILabel!
    
    @IBOutlet weak var lblprice: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var vimg: UIImageView!
    
    @IBOutlet weak var btnindex: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        status.layer.cornerRadius = status.layer.frame.height/13
        
        self.vimg.layer.masksToBounds = true
        self.vimg.layer.cornerRadius = self.vimg.layer.frame.size.width / 2.1
        self.vimg.layer.borderWidth = 5.0
        self.vimg.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        // Configure the view for the selected state
        btnindex.isHidden = true
    }
    
    @IBAction func btnindex(_ sender: UIButton) {
        delegate?.Cellbtntapped(tag: sender.tag)
    }
    

}
