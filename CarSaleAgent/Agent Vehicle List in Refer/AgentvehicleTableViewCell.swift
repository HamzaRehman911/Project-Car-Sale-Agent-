//
//  AgentvehicleTableViewCell.swift
//  CarSaleAgent
//
//  Created by Apple on 12/07/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

protocol CellDelegate3:class {
    func Cellbtntapped3(tag:Int)
}

class AgentvehicleTableViewCell: UITableViewCell {

    weak var delegate3:CellDelegate3?
    
    @IBOutlet weak var btnrecommend: UIButton!
    
    
    @IBOutlet weak var lblvname: UILabel!
    @IBOutlet weak var lblmake: UILabel!
    @IBOutlet weak var lblprice: UILabel!
    @IBOutlet weak var lblmodel: UILabel!
    @IBOutlet weak var vimg: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        self.vimg.layer.masksToBounds = true
        self.vimg.layer.cornerRadius = self.vimg.layer.frame.size.width / 2.4
        
        self.vimg.clipsToBounds = true
    }
    
    //btnrecommend
    
    @IBAction func btnRecommend(_ sender: UIButton) {
        
        delegate3?.Cellbtntapped3(tag: sender.tag)
        
    }
    

}
