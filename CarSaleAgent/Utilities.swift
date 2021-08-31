//
//  Utilities.swift
//  CarSaleAgent
//
//  Created by Apple on 17/04/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import Foundation
import UIKit
class Utilities {
    
    public static func getimageFromurl (name: String)->UIImage?
    {
        let _url = URL(string: "http://10.211.55.6/carsale/Photo/\(name)")
        guard let url = _url else{
            return nil
            
        }
        let _data = try? Data(contentsOf: url)
        guard let data = _data else{
            
            return nil
        }
        let image = UIImage(data: data)
        return image
    }
    
}
//class TestUtilities2 {
//
//    public static func getimageFromurl2 (name1: String,name2: String,name3: String)->[UIImage]?
//    {
//        let _url = URL(string: "http://10.211.55.6/carsale/Photo/\(name1)\(name2)\(name3)")
//        guard let url = _url else{
//            return nil
//
//        }
//        let _data = try? Data(contentsOf: url)
//        guard let data = _data else{
//
//            return nil
//        }
//        let  image:[UIImage] = UIImage(data: sdata)
//        return image
//    }
//
//}
