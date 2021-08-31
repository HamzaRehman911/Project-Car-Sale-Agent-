//
//  ResponseVimgCollectionViewCell.swift
//  CarSaleAgent
//
//  Created by Apple on 19/06/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class ResponseVimgCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var vimg: UIImageView!
    
    override func layoutSubviews() {
        self.vimg.layer.masksToBounds = true
        self.vimg.layer.cornerRadius = self.vimg.layer.frame.size.width / 14.0
        
        self.vimg.clipsToBounds = true
    }
}
